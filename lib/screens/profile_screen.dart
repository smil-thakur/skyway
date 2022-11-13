import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/login_methods.dart';
import 'package:skyway/screens/login_screen.dart';
import 'package:skyway/screens/skyplus_plus_screen.dart';
import 'package:skyway/widgets/profile_button.dart';

class PorfilePage extends StatefulWidget {
  const PorfilePage({super.key});

  @override
  State<PorfilePage> createState() => _PorfilePageState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _PorfilePageState extends State<PorfilePage> {
  bool paid = false;
  bool isloading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  premiumUpdate() async {
    var user = await users.doc(auth.currentUser!.uid).get();
    Map<String, dynamic> data = user.data() as Map<String, dynamic>;
    paid = data['paid'];
    isloading = false;
    setState(() {});
  }

  premiumonlick() async {
    var user = await users.doc(auth.currentUser!.uid).get();
    Map<String, dynamic> data = user.data() as Map<String, dynamic>;
    if (data['paid'] == true) {
      await users.doc(auth.currentUser!.uid).update({
        "paid": false,
      });
      paid = false;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Your premium subscriptions ended")));
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    premiumUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  _auth.currentUser!.photoURL!,
                  width: 80,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(_auth.currentUser!.displayName!),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Divider(
              color: Colors.white,
              height: 1,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.light_mode_outlined,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Light Mode",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.group_outlined,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "About Us",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Log Out",
                      style: GoogleFonts.inter(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (paid == false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Skyplus()));
                      } else {
                        premiumonlick();
                      }
                    },
                    child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            paid ? "End premium" : "Go premium",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  paid
                      ? Container()
                      : Text(
                          "Get our premium!",
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                          ),
                        )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomAppBar(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  heightFactor: 1,
                  child: Text(
                    "Privacy policy & Terms and Conditions",
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                    ),
                  )),
            )),
      ),
    );
  }
}
