import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GoogleService {
  final GoogleSignIn _googleSignIn;

  GoogleService(this._googleSignIn);

  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;

  Future<GoogleSignInAccount?> login() async {
    return await _googleSignIn.signIn();
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
  }
}
