import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class PrefButton extends StatelessWidget {
  final bool selected;
  final String text;
  const PrefButton({super.key, required this.selected, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.black,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                  color: selected ? Colors.black : Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: selected ? Colors.black : Colors.white,
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: GoogleFonts.inter(
                        color: selected ? Colors.white : Colors.black),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
