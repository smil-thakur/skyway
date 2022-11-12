import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserGoogle(User user) async {
    await users.doc(user.uid).set({
      "name": user.displayName,
    });
  }

  Future<void> updateUser(
      String id, List pref, String priority, bool paid) async {
    await users.doc(id).update({
      "pref": pref,
      "priority": priority,
      "paid": paid,
    });
  }

  Future<List<String>> updateList(String id) async {
    var user = await users.doc(id).get();
    Map<String, dynamic> data = user.data() as Map<String, dynamic>;
    List<dynamic> pref = data['pref'];
    List<String> uplist = [];
    for (int i = 0; i < pref.length; i++) {
      uplist.add(pref[i].toString());
    }
    print(uplist);
    return uplist;
  }
}
