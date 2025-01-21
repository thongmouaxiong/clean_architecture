import 'package:clean_architecture/core/services/google_service.dart';
import 'package:clean_architecture/features/login/data/model/login_register_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  Future<GoogleSignInAccount?> loginWithGoogle();
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
    final GoogleSignInAccount? googleAccount = await _googleService.login();

    final googleAuth = await googleAccount?.authentication;

    OAuthCredential? oAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _firebaseAuth.signInWithCredential(oAuthCredential);

    return googleAccount;
  }

  @override
  Future<LoginResult?> loginWithFacebook() async {
    final LoginResult facebookAccount = await _facebookAuth.login();

    final AccessToken? facebookToken = facebookAccount.accessToken;

    final OAuthCredential oAuthCredential =
        FacebookAuthProvider.credential(facebookToken?.tokenString ?? "");

    await _firebaseAuth.signInWithCredential(oAuthCredential);

    return facebookAccount;
  }

  @override
  Future<UserCredential?> loginWithFirebase(LoginRegisterData data) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  @override
  Future<UserCredential?> registerWithFirebase(LoginRegisterData data) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  @override
  User? currentFirebaseUser() => _firebaseAuth.currentUser;
}
