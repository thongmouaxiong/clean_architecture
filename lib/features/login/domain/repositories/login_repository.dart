import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:either_dart/either.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginRepository {
  Future<Either<AppError, GoogleSignInAccount?>> loginWithGoogle();
  Either<AppError, GoogleSignInAccount?> currentGoogleUser();
}
