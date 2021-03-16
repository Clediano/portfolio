import 'package:flutter/material.dart';

class Article {
  String image;
  String title;
  String subTitle;
  String description;

  Article({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.subTitle,
  });
}
