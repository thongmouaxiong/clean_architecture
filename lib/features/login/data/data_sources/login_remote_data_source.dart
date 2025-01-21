import 'package:clean_architecture/core/services/google_service.dart';
import 'package:clean_architecture/features/login/data/model/login_register_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  Future<GoogleSignInAccount?> loginWithGoogle();
  GoogleSignInAccount? currentGoogleUser();
  Future<LoginResult?> loginWithFacebook();

  Future<UserCredential?> loginWithFirebase(LoginRegisterData data);
  Future<UserCredential?> registerWithFirebase(LoginRegisterData data);
  User? currentFirebaseUser();
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final GoogleService _googleService;
  final FacebookAuth _facebookAuth;
  final FirebaseAuth _firebaseAuth;

  LoginRemoteDataSourceImpl(
    this._googleService,
    this._facebookAuth,
    this._firebaseAuth,
  );

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

  @override
  Future<UserCredential?> loginWithFirebase(LoginRegisterData data) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  @override
  Future<UserCredential?> registerWithFirebase(LoginRegisterData data) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  @override
  User? currentFirebaseUser() => _firebaseAuth.currentUser;
}
