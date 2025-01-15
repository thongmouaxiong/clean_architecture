import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginWithFacebookUsecase extends UsecaseNoParam<LoginResult?> {
  final LoginRepository _loginRepo;

  LoginWithFacebookUsecase(this._loginRepo);

  @override
  Future<Either<AppError, LoginResult?>> call() async {
    return await _loginRepo.loginWithFacebook();
  }
}
