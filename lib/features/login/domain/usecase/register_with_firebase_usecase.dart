import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/login/data/model/login_register_data.dart';
import 'package:clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegisterWithFirebaseUsecase
    extends Usecase<UserCredential?, LoginRegisterData> {
  final LoginRepository _loginRepository;

  RegisterWithFirebaseUsecase(this._loginRepository);

  @override
  Future<Either<AppError, UserCredential?>> call(
    LoginRegisterData param,
  ) async {
    return await _loginRepository.registerWithFirebase(param);
  }
}
