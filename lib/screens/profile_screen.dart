import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(_auth.currentUser!.photoURL!),
          )
        ],
      ),
    );
  }
}
