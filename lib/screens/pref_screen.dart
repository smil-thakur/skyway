import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/preference_mthods.dart';
import 'package:skyway/widgets/pref_button.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  List<String> choice = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff282828),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Select Your Preferences",
            style: GoogleFonts.inter(),
          ),
        ),
        body: Center(
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: NewsPreference().pref.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrefButton(
                    selected: true,
                    text: NewsPreference().pref[index],
                  ),
                );
              }),
        ));
  }
}
