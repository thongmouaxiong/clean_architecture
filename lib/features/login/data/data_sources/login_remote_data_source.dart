import 'package:clean_architecture/core/services/google_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  Future<GoogleSignInAccount?> loginWithGoogle();
  GoogleSignInAccount? currentGoogleUser();
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final GoogleService _googleService;

  LoginRemoteDataSourceImpl(this._googleService);

  @override
  Future<GoogleSignInAccount?> loginWithGoogle() async {
    return await _googleService.login();
  }

  @override
  GoogleSignInAccount? currentGoogleUser() {
    return _googleService.currentUser;
  }
}
