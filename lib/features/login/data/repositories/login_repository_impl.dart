import 'package:clean_architecture/core/constants/error_message.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:either_dart/either.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemote;

  LoginRepositoryImpl(this._loginRemote);

  @override
  Either<AppError, GoogleSignInAccount?> currentGoogleUser() {
    try {
      final user = _loginRemote.currentGoogleUser();
      return Right(user);
    } catch (err) {
      return const Left(AppError(
        title: ErrorMessage.defaultMessage,
        msg: ErrorMessage.getGoogleUserFail,
      ));
    }
  }

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
}
