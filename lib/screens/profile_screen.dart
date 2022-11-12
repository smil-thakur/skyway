import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/widgets/profile_button.dart';

class PorfilePage extends StatefulWidget {
  const PorfilePage({super.key});

  @override
  State<PorfilePage> createState() => _PorfilePageState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _PorfilePageState extends State<PorfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        toolbarHeight: 150,
        title: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    _auth.currentUser!.photoURL!,
                    width: 75,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _auth.currentUser!.displayName!,
                  style: GoogleFonts.inter(fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff282828),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ProfileButton(text: "Light Mode"),
          ProfileButton(text: "Light Mode"),
          ProfileButton(text: "Light Mode"),
          ProfileButton(text: "Light Mode"),
        ],
      ),
    );
  }
}
