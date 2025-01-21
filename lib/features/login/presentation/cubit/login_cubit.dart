import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/utils/extension/form_state_extension.dart';
import 'package:clean_architecture/features/login/data/model/login_register_data.dart';
import 'package:clean_architecture/features/login/domain/usecase/get_current_firebase_user_usecase.dart';
import 'package:clean_architecture/features/login/domain/usecase/login_with_facebook_usecase.dart';
import 'package:clean_architecture/features/login/domain/usecase/login_with_firebase_usecase.dart';
import 'package:clean_architecture/features/login/domain/usecase/login_with_google_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/features/login/presentation/cubit/login_state.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final LoginWithGoogleUsecase _loginWithGoogleUsecase;
  final LoginWithFacebookUsecase _loginWithFacebookUsecase;
  final LoginWithFirebaseUsecase _loginWithFirebaseUsecase;
  final GetCurrentFirebaseUserUsecase _getCurrentFirebaseUserUsecase;

  LoginCubit(
    this._loginWithGoogleUsecase,
    this._loginWithFacebookUsecase,
    this._loginWithFirebaseUsecase,
    this._getCurrentFirebaseUserUsecase,
  ) : super(const LoginState());

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void init() async {
    emit(state.copyWith(status: StateStatus.loading));
    await Future.delayed(const Duration(milliseconds: 100));
    final resUser = _getCurrentFirebaseUserUsecase();
    if (resUser.isLeft) {
      emit(state.copyWith(
        status: StateStatus.error,
        error: resUser.left,
      ));
    } else {
      final bool alreadyLogined = resUser.right != null;
      emit(state.copyWith(
        status: StateStatus.success,
        alreadyLogined: alreadyLogined,
      ));
    }
  }

  Future<void> onLoginWithGoogle() async {
    emit(state.copyWith(status: StateStatus.processing));

    final resLogin = await _loginWithGoogleUsecase();

    if (resLogin.isLeft) {
      emit(state.copyWith(
        status: StateStatus.error,
        error: resLogin.left,
      ));
    } else {
      emit(state.copyWith(status: StateStatus.success));
    }
  }

  Future<void> onLoginWithFacebook() async {
    emit(state.copyWith(status: StateStatus.processing));

    final resLogin = await _loginWithFacebookUsecase();

    if (resLogin.isLeft) {
      emit(state.copyWith(
        status: StateStatus.error,
        error: resLogin.left,
      ));
    } else {
      emit(state.copyWith(status: StateStatus.success));
    }
  }

  Future<void> onLoginWithFirebase() async {
    if (formKey.validated) {
      final LoginRegisterData loginData =
          LoginRegisterData.fromJson(formKey.formData ?? {});

      final resLogin = await _loginWithFirebaseUsecase(loginData);

      if (resLogin.isLeft) {
        emit(state.copyWith(
          status: StateStatus.error,
          error: resLogin.left,
        ));
      } else {
        emit(state.copyWith(status: StateStatus.success));
      }
    }
  }
}
