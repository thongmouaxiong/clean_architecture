import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:either_dart/either.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCurrentGoogleUser extends UsecaseNormalNoParam<GoogleSignInAccount?> {
  final LoginRepository _loginRepo;

  GetCurrentGoogleUser(this._loginRepo);

  @override
  Either<AppError, GoogleSignInAccount?> call() {
    return _loginRepo.currentGoogleUser();
  }
}
