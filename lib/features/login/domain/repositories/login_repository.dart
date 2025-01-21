import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/login/data/model/login_register_data.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginRepository {
  Future<Either<AppError, GoogleSignInAccount?>> loginWithGoogle();

  Future<Either<AppError, LoginResult?>> loginWithFacebook();

  Future<Either<AppError, UserCredential?>> loginWithFirebase(
      LoginRegisterData data);
  Future<Either<AppError, UserCredential?>> registerWithFirebase(
      LoginRegisterData data);
  Either<AppError, User?> currentFirebaseUser();
}
