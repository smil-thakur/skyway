import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get authChanges => auth.authStateChanges();

  Future<User?> SiginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      var res = await auth.signInWithCredential(credential);
      print(res);
      return res.user!;
    } catch (e) {
      return null;
    }
  }

  Future mySingOut() async {
    try {
      auth.signOut();
      GoogleSignIn().signOut();
      print(auth.currentUser);
    } catch (e) {
      print(e);
    }
  }
}
