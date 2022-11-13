import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyway/methods/firebase_method.dart';
import 'package:skyway/methods/login_methods.dart';
import 'package:skyway/methods/news_fetch.dart';
import 'package:skyway/methods/news_model.dart';
import 'package:skyway/methods/preference_mthods.dart';
import 'package:skyway/screens/news_screen.dart';
import 'package:skyway/screens/profile_screen.dart';
import 'package:skyway/widgets/preference.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User user = FirebaseAuth.instance.currentUser!;
  bool isloading = true;
  bool isloadingtab = true;
  List<NewModel> news = [];
  List<String> pref = [];
  bool trending = false;
  var first = "";

  Future<void> fetchNews(String category) async {
    isloading = true;
    setState(() {});
    news = await NewsFetch().getNewsCategory(category);
    isloading = false;

    setState(() {});
  }

  Future<void> updatePref() async {
    pref = await FirebaseMethods().updateList(user.uid);
    List<String> og = NewsPreference().pref;
    for (int i = 0; i < og.length; i++) {
      if (!(pref.contains(og[i]))) {
        pref.add(og[i]);
      }
    }
    isloadingtab = false;
    setState(() {});
  }

  void updateScreen(String category) async {
    trending = false;
    await fetchNews(category);
    first = category;
    setState(() {});
  }

  Future<void> fetchPopularity() async {
    isloading = true;
    setState(() {});
    news = await NewsFetch().getNewspopularity(first);
    print(first);
    isloading = false;
    setState(() {});
  }

  void start() async {
    await updatePref();
    await fetchNews(pref[0]);
    first = pref[0];
    setState(() {});
  }

  @override
  void initState() {
    start();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 100,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (trending == false) {
                      trending = true;
                      fetchPopularity();
                      setState(() {});
                    } else {
                      updateScreen(first);
                      setState(() {});
                    }
                  },
                  child: Icon(
                    trending
                        ? Icons.local_fire_department
                        : Icons.local_fire_department_outlined,
                    color: trending ? Colors.orange : Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PorfilePage()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        user.photoURL!,
                        width: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/bg.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          isloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isloadingtab
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        : PreferenceTab(
                            fun: updateScreen,
                            pref: pref,
                            first: first,
                          ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: news.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NewsScreen(news: news[index]),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                errorWidget:
                                                    (context, url, error) {
                                                  return Image.asset(
                                                      "assets/logo.png");
                                                },
                                                imageUrl: news[index].imageUrl,
                                                placeholder: (context, url) =>
                                                    const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                              news[index].title,
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child:
                                                Text(news[index].description),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              news[index]
                                                  .pubdate
                                                  .substring(0, 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
