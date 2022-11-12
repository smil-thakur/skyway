import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/preference_mthods.dart';
import 'package:skyway/widgets/pref_tab_button.dart';

class PreferenceTab extends StatelessWidget {
  final List<String> pref;
  final String first;
  final Function(String category) fun;
  const PreferenceTab(
      {super.key, required this.pref, required this.first, required this.fun});

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
            return InkWell(
              onTap: () {
                fun(pref[index]);
              },
              child: PrefTabButton(
                iconData: NewsPreference().prefIcon(pref[index]),
                title: pref[index][0].toUpperCase() + pref[index].substring(1),
                selected: pref[index] == first ? true : false,
              ),
            );
          })),
    );
  }
}
