import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skyway/methods/aboutus_model.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    List<AboutModel> us = [];
    var smil = AboutModel(
        name: "Smil Raj Thakur",
        role: "Back-End",
        photoUrl: "https://avatars.githubusercontent.com/u/75114432?v=4");

    var aa22 = AboutModel(
        name: "Aarshita Acharya",
        role: "Back-End & Documentation",
        photoUrl: "https://avatars.githubusercontent.com/u/83179688?v=4");

    var divy = AboutModel(
        name: "Divya Panchori",
        role: "UI-UX & Front-End",
        photoUrl: "https://avatars.githubusercontent.com/u/86241333?v=4");

    var tanmay = AboutModel(
        name: "Tanmay Kashyap",
        role: "UI-UX & Front-End",
        photoUrl: "https://avatars.githubusercontent.com/u/84329566?v=4");

    us.add(smil);
    us.add(aa22);
    us.add(divy);
    us.add(tanmay);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("About Us"),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/bg.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: us.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                us[index].photoUrl,
                                width: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Name: ${us[index].name}"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Role: ${us[index].role}"),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
