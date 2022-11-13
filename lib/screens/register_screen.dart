import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/login_methods.dart';
import 'package:skyway/screens/home_screen.dart';
import 'package:skyway/screens/login_screen.dart';
import 'package:skyway/screens/pref_screen.dart';
import 'package:skyway/widgets/signin_google.dart';
import 'package:skyway/widgets/text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  void navigate(User user, BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PreferenceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: ClipRect(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            width: 200,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const MytextField(hint: "Name"),
                          const SizedBox(height: 10),
                          const MytextField(hint: "Email"),
                          const SizedBox(
                            height: 10,
                          ),
                          const MytextField(hint: "Password"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("OR"),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () async {
                                  User? user =
                                      await LoginMethods().SiginGoogle();
                                  if (user == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "already register please log in")));
                                  } else {
                                    navigate(user, context);
                                  }
                                },
                                child: const SigninGoogleButton()),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Already a User? Sign in",
                                style: GoogleFonts.inter(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "By continuing the signin process you agree with\nall terms and conditions",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
