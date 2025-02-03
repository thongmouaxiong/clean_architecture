import 'package:clean_architecture/core/constants/error_message.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:clean_architecture/features/login/data/model/login_register_data.dart';
import 'package:clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemote;

  LoginRepositoryImpl(this._loginRemote);

  @override
  Future<Either<AppError, GoogleSignInAccount?>> loginWithGoogle() async {
    try {
      final user = await _loginRemote.loginWithGoogle();
      return Right(user);
    } catch (err) {
      return const Left(AppError(
        title: ErrorMessage.defaultMessage,
        msg: ErrorMessage.loginGoogleFail,
      ));
    }
  }

  @override
  Future<Either<AppError, LoginResult?>> loginWithFacebook() async {
    try {
      final user = await _loginRemote.loginWithFacebook();
      return Right(user);
    } catch (err) {
      return const Left(AppError(
        title: ErrorMessage.defaultMessage,
        msg: ErrorMessage.loginFacebookFail,
      ));
    }
  }

  @override
  Either<AppError, User?> currentFirebaseUser() {
    try {
      final user = _loginRemote.currentFirebaseUser();
      return Right(user);
    } catch (err) {
      return const Left(AppError(
        title: ErrorMessage.defaultMessage,
        msg: ErrorMessage.currentfirebaseUserFail,
      ));
    }
  }

  @override
  Future<Either<AppError, UserCredential?>> loginWithFirebase(
    LoginRegisterData data,
  ) async {
    try {
      final user = await _loginRemote.loginWithFirebase(data);
      return Right(user);
    } catch (err) {
      return const Left(AppError(
        title: ErrorMessage.defaultMessage,
        msg: ErrorMessage.loginFirebaseFail,
      ));
    }
  }

  @override
  Future<Either<AppError, UserCredential?>> registerWithFirebase(
    LoginRegisterData data,
  ) async {
    try {
      final user = await _loginRemote.registerWithFirebase(data);
      return Right(user);
    } catch (err) {
      return const Left(AppError(
        title: ErrorMessage.defaultMessage,
        msg: ErrorMessage.registerFirebaseFail,
      ));
    }
  }
}
