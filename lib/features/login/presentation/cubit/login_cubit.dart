import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/features/login/domain/usecase/get_current_google_user.dart';
import 'package:clean_architecture/features/login/domain/usecase/login_with_google_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/features/login/presentation/cubit/login_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final GetCurrentGoogleUser _getCurrentGoogleUser;
  final LoginWithGoogleUsecase _loginWithGoogleUsecase;
  LoginCubit(
    this._getCurrentGoogleUser,
    this._loginWithGoogleUsecase,
  ) : super(const LoginState());

  void init() {
    emit(state.copyWith(status: StateStatus.loading));

    final resCurrentUser = _getCurrentGoogleUser();

    if (resCurrentUser.isLeft) {
      emit(state.copyWith(
        status: StateStatus.error,
        error: resCurrentUser.left,
      ));
    } else {
      final bool alreadLogined = resCurrentUser.right != null;

      emit(state.copyWith(
        status: StateStatus.done,
        alreadLogined: alreadLogined,
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
}
