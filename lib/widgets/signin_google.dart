import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninGoogleButton extends StatelessWidget {
  const SigninGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      constraints: const BoxConstraints(maxWidth: 300),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/g_logo.png",
              width: 45,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Continue with Google",
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
