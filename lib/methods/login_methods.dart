import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => auth.authStateChanges();
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<String> loginGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    var res = await auth.signInWithCredential(credential);
    String result = "No";
    bool exists = false;
    await users.doc(res.user!.uid).get().then((value) {
      exists = value.exists ? true : false;
      print(exists);
    });
    if (exists == true) {
      result = "yes";
      print("yayy");
      return result;
    } else {
      GoogleSignIn().signOut();
      auth.signOut();
      return result;
    }
  }

  Future<User?> SiginGoogle() async {
    try {
      bool exists = false;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      var res = await auth.signInWithCredential(credential);
      print(res);
      await users.doc(res.user!.uid).get().then((value) {
        exists = value.exists ? true : false;
        print(exists);
      });
      if (exists == true) {
        GoogleSignIn().signOut();
        auth.signOut();
        return null;
      } else {
        return res.user!;
      }
    } catch (e) {
      return null;
    }
  }

  Future mySingOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }
}
