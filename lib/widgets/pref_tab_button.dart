import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class PrefTabButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool selected;
  const PrefTabButton(
      {super.key,
      required this.iconData,
      required this.title,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.black,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 20,
                color: selected ? Colors.black : Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: selected ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
