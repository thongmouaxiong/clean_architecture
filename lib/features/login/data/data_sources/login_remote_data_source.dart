import 'package:clean_architecture/core/services/google_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  Future<GoogleSignInAccount?> loginWithGoogle();
  GoogleSignInAccount? currentGoogleUser();
  Future<LoginResult?> loginWithFacebook();
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final GoogleService _googleService;
  final FacebookAuth _facebookAuth;

  LoginRemoteDataSourceImpl(this._googleService, this._facebookAuth);

  @override
  Future<GoogleSignInAccount?> loginWithGoogle() async {
    return await _googleService.login();
  }

  @override
  GoogleSignInAccount? currentGoogleUser() {
    return _googleService.currentUser;
  }

  @override
  Future<LoginResult?> loginWithFacebook() async {
    return await _facebookAuth.login();
  }
}
