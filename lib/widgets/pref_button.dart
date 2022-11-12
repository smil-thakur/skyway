import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class PrefButton extends StatefulWidget {
  final String text;
  final String count;
  final bool selected;
  const PrefButton(
      {super.key,
      required this.text,
      required this.count,
      required this.selected});

  @override
  State<PrefButton> createState() => _PrefButtonState();
}

class _PrefButtonState extends State<PrefButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.selected
            ? Colors.white.withOpacity(0.8)
            : Colors.black.withOpacity(0.3),
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
              widget.text,
              style: GoogleFonts.inter(
                  color: widget.selected ? Colors.black : Colors.white),
            ),
            SizedBox(
              width: widget.selected ? 10 : 0,
            ),
            !widget.selected
                ? Container()
                : Icon(
                    Icons.check,
                    color: widget.selected ? Colors.black : Colors.transparent,
                  )
          ],
        ),
      ),
    );
  }
}
