import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skyway/methods/login_methods.dart';
import 'package:skyway/screens/home_screen.dart';
import 'package:skyway/screens/login_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: LoginMethods().authChanges,
      builder: (context, snapshot) {
        print("sun raha hun");
        if (snapshot.hasData) {
          return HomeScreen(user: FirebaseAuth.instance.currentUser!);
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const LoginScreen();
      },
    );
  }
}
