import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/news_model.dart';
import 'package:skyway/screens/fullnews_screen.dart';

class NewsScreen extends StatefulWidget {
  final NewModel news;
  const NewsScreen({super.key, required this.news});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isloading = true;
  bool paid = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  premiumUpdate() async {
    var user = await users.doc(auth.currentUser!.uid).get();
    Map<String, dynamic> data = user.data() as Map<String, dynamic>;
    paid = data['paid'];
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    premiumUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff282828),
      body: Column(children: [
        Stack(children: [
          CachedNetworkImage(
            errorWidget: (context, url, error) {
              return Image.asset(
                "assets/logo.png",
                width: 200,
              );
            },
            imageUrl: widget.news.imageUrl,
            height: 200,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            placeholder: (context, url) => const CircleAvatar(),
          ),
          Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                color: Colors.black,
              ),
              margin: const EdgeInsets.only(top: 150),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    widthFactor: 1,
                    child: Text(
                      widget.news.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
          ),
        ]),
        SingleChildScrollView(
          child: SizedBox(
            width: 320,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Author: ${widget.news.author}",
                  style: GoogleFonts.inter(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  widget.news.description,
                  // textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                  ),
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.news.content.substring(0, 200),
                  // textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FullNewScreen(newsURL: widget.news.url)));
                  },
                  child: Stack(children: [
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                        child: InkWell(
                            child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: isloading
                                ? const CircularProgressIndicator()
                                : Text(
                                    paid ? "Read more" : "Read with Ads",
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                    ),
                                  ),
                          ),
                        )),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
