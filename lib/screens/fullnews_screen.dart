import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullNewScreen extends StatefulWidget {
  final String newsURL;
  const FullNewScreen({super.key, required this.newsURL});

  @override
  State<FullNewScreen> createState() => _FullNewScreenState();
}

class _FullNewScreenState extends State<FullNewScreen> {
  final Completer<WebViewController> _completer = Completer();
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
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          width: 100,
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: WebView(
              javascriptMode:
                  paid ? JavascriptMode.disabled : JavascriptMode.unrestricted,
              initialUrl: widget.newsURL,
              onWebViewCreated: ((WebViewController webViewController) {
                _completer.complete(webViewController);
              }),
              onPageFinished: (value) {
                isloading = false;
                setState(() {});
              },
            ),
          ),
          isloading
              ? const Center(child: CircularProgressIndicator())
              : Stack(),
        ],
      ),
    );
  }
}
