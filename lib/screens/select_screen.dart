import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/widgets/pref_button.dart';

class SelectedScreen extends StatefulWidget {
  final List selected;
  const SelectedScreen({super.key, required this.selected});

  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
  List<bool> priority = [];
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < widget.selected.length; i++) {
      priority.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/bgpref.png",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.selected.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          priority[index] = priority[index] ? false : true;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: PrefButton(
                                text: widget.selected[index],
                                count: "1",
                                selected: priority[index]),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
