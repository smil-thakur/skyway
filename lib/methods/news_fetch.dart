import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skyway/methods/news_model.dart';

class NewsFetch {
  final String API_KEY = "1376078cd8774cf78cedbd73a3062e9a";

  Future<List<NewModel>> getNews() async {
    List<NewModel> news = [];
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=1376078cd8774cf78cedbd73a3062e9a";

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
                  element["author"] != null ? element['author'] : "Anonmous",
              content: element["content"] != null
                  ? element['content']
                  : "Non Further Content Available",
              description: element['description'],
              imageUrl: element['urlToImage'],
              title: element['title'],
              url: element['url']);

          news.add(articleModel1);
        }
      });
    }
    return news;
  }

  Future<List<NewModel>> getNewsCategory(String category) async {
    List<NewModel> news = [];
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=1376078cd8774cf78cedbd73a3062e9a";

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
              url: element['url']);

          news.add(articleModel1);
        }
      });
    }
    return news;
  }
}
