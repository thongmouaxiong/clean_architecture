import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCurrentFirebaseUserUsecase extends UsecaseNormalNoParam<User?> {
  final LoginRepository _loginRepository;

  GetCurrentFirebaseUserUsecase(this._loginRepository);

  @override
  Either<AppError, User?> call() {
    return _loginRepository.currentFirebaseUser();
  }
}
