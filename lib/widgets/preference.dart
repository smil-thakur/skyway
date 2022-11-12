import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/preference_mthods.dart';

class PreferenceTab extends StatelessWidget {
  final List<String> pref;
  const PreferenceTab({super.key, required this.pref});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: pref.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        NewsPreference().prefIcon(pref[index]),
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        pref[index][0].toUpperCase() + pref[index].substring(1),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
