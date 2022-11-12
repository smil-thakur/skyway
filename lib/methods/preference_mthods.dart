import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewsPreference {
  List<String> pref = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];

  IconData prefIcon(String title) {
    if (title == "business") {
      return Icons.trending_up;
    } else if (title == "entertainment") {
      return Icons.movie_filter_outlined;
    } else if (title == "general") {
      return Icons.language;
    } else if (title == "health") {
      return Icons.emergency_outlined;
    } else if (title == "science") {
      return Icons.science;
    } else if (title == "sports") {
      return Icons.sports_tennis_outlined;
    } else {
      return Icons.devices;
    }
  }
}
