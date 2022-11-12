import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/firebase_method.dart';
import 'package:skyway/methods/preference_mthods.dart';
import 'package:skyway/screens/home_screen.dart';
import 'package:skyway/screens/select_screen.dart';
import 'package:skyway/widgets/next_button.dart';
import 'package:skyway/widgets/pref_button.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  List<String> choice = [];
  var news = NewsPreference().selectperf;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<bool> selecteds = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Image.asset(
              "assets/bgpref.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "What are you into?",
                      style: GoogleFonts.inter(fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pick any four categories",
                      style: GoogleFonts.inter(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: news.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        return news[index] == "next"
                            ? InkWell(
                                onTap: () async {
                                  if (choice.length == 4) {
                                    await FirebaseMethods()
                                        .addUserGoogle(_auth.currentUser!);
                                    await FirebaseMethods().updateUser(
                                        _auth.currentUser!.uid,
                                        choice,
                                        "",
                                        false);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Select four priorities")));
                                  }
                                },
                                child: const NextButton())
                            : InkWell(
                                onTap: () {
                                  if (news[index] != "next") {
                                    print("tap");
                                    print(choice);
                                    if (choice.length >= 4 &&
                                        !(choice.contains(news[index]))) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              content: Text(
                                                  "You can not choose more than four options")));
                                    }
                                    if (choice.contains(news[index])) {
                                      choice.remove(news[index]);
                                      selecteds[index] =
                                          selecteds[index] ? false : true;
                                    } else if (choice.length < 4) {
                                      choice.add(news[index]);
                                      selecteds[index] =
                                          selecteds[index] ? false : true;
                                    }
                                    setState(() {});
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: PrefButton(
                                    count: "1",
                                    text: news[index][0].toUpperCase() +
                                        news[index].substring(1),
                                    selected: selecteds[index],
                                  ),
                                ),
                              );
                      }),
                ],
              ),
            ),
          ])),
    );
  }
}
