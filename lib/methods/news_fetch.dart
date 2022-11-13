import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skyway/methods/news_model.dart';

class NewsFetch {
  final String API_KEY = "1abd2a04738f40029750501e1f9baa5b";

  Future<List<NewModel>> getNews() async {
    List<NewModel> news = [];
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=$API_KEY";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    print(jsonData);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["title"] != null &&
            element["content"] != null &&
            element["url"] != null) {
          NewModel articleModel1 = NewModel(
            author: element["author"] != null ? element['author'] : "Anonmous",
            content: element["content"] != null
                ? element['content']
                : "Non Further Content Available",
            description: element['description'],
            imageUrl: element['urlToImage'],
            title: element['title'],
            url: element['url'],
            pubdate: element['publishedAt'],
          );

          news.add(articleModel1);
        }
      });
    }
    return news;
  }

  Future<List<NewModel>> getNewsCategory(String category) async {
    List<NewModel> news = [];
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$API_KEY";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    print(jsonData);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["title"] != null &&
            element["content"] != null &&
            element["url"] != null) {
          NewModel articleModel1 = NewModel(
              author:
                  element["author"] != null ? element['author'] : "Anonymous",
              content: element["content"] != null
                  ? element['content']
                  : "Non Further Content Available",
              description: element['description'],
              imageUrl: element['urlToImage'],
              title: element['title'],
              url: element['url'],
              pubdate: element["publishedAt"]);

          news.add(articleModel1);
        }
      });
    }
    return news;
  }

  Future<List<NewModel>> getNewspopularity(String category) async {
    List<NewModel> news = [];
    String url =
        "https://newsapi.org/v2/everything?q=$category&sortBy=popularity&apiKey=$API_KEY";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    print(jsonData);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["title"] != null &&
            element["content"] != null &&
            element["url"] != null) {
          NewModel articleModel1 = NewModel(
              author:
                  element["author"] != null ? element['author'] : "Anonymous",
              content: element["content"] != null
                  ? element['content']
                  : "Non Further Content Available",
              description: element['description'],
              imageUrl: element['urlToImage'],
              title: element['title'],
              url: element['url'],
              pubdate: element['publishedAt']);

          news.add(articleModel1);
        }
      });
    }
    return news;
  }
}
