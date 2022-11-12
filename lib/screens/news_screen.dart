import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/news_model.dart';

class NewsScreen extends StatelessWidget {
  final NewModel news;
  const NewsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff282828),
      body: Column(children: [
        Stack(children: [
          CachedNetworkImage(
            imageUrl: news.imageUrl,
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
                      news.title,
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
          child: Container(
            width: 320,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Author: ${news.author}",
                  style: GoogleFonts.inter(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  news.description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                  ),
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  news.content,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                  ),
                ),
                Center(
                  heightFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Read More",
                          style: GoogleFonts.inter(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
