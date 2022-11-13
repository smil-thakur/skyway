import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/firebase_method.dart';
import 'package:skyway/screens/home_screen.dart';

class PayThrough extends StatefulWidget {
  const PayThrough({super.key});

  @override
  State<PayThrough> createState() => _PayThroughState();
}

class _PayThroughState extends State<PayThrough> {
  bool first = false;
  bool second = false;
  bool third = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void navigate(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 700),
        content: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.green,
            ),
            width: 120,
            height: 120,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Payment succeded",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
          ),
        ),
      ),
    );
    Future.delayed(
      const Duration(milliseconds: 500),
    );
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/bg.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      "Skyway+",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      "Pay through",
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                        child: Text(
                          "As per new RBI guidelines, some of your saved cards maybe removed, Please re-enter card details and save it. Learn more",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (second == false && third == false) {
                        first = first ? false : true;
                        await FirebaseMethods()
                            .premiumok(auth.currentUser!.uid);
                        navigate(context);
                        setState(() {});
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: first
                              ? Colors.green
                              : Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/bhim.png",
                                width: 80,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Pay with UPI",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: first ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (first == false && third == false) {
                        second = second ? false : true;
                        await FirebaseMethods()
                            .premiumok(auth.currentUser!.uid);
                        navigate(context);
                        setState(() {});
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: second
                              ? Colors.green
                              : Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                          child: Row(
                            children: [
                              const Icon(Icons.account_balance_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Pay with Net banking",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: second ? Colors.black : Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (first == false && second == false) {
                        third = third ? false : true;
                        await FirebaseMethods()
                            .premiumok(auth.currentUser!.uid);
                        navigate(context);
                        setState(() {});
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: third
                              ? Colors.green
                              : Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                          child: Row(
                            children: [
                              Icon(Icons.credit_card_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Pay with Credit Card",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: third ? Colors.black : Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
