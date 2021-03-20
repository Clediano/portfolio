import 'package:flutter/material.dart';
import 'package:portfolio/models/Card.dart';
import 'package:portfolio/models/Experience.dart';

final List<Article> articles = [
  Article(
    image:
        "https://images.unsplash.com/photo-1468070454955-c5b6932bd08d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    title: "Greyhound divisively",
    subTitle:
        "Greyhound divisively hello coldly wonderfully marginally far upon excluding.",
  ),
  Article(
    image:
        "https://images.unsplash.com/photo-1483736762161-1d107f3c78e1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80",
    title: "Wonderfully marginally",
    subTitle:
        "Greyhound divisively hello coldly wonderfully marginally far upon excluding hello coldly wonderfully marginally far upon excluding hello coldly wonderfully marginally far upon excluding",
  ),
  Article(
    image:
        "https://images.unsplash.com/photo-1489875347897-49f64b51c1f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    title: "Upon excluding",
    subTitle:
        "Greyhound divisively hello coldly wonderfully marginally far upon excluding.",
  ),
  Article(
    image:
        "https://images.unsplash.com/photo-1597852074816-d933c7d2b988?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    title: "Divisively hello coldly",
    subTitle:
        "Greyhound divisively hello coldly wonderfully marginally far upon excluding.",
  ),
  Article(
    image:
        "https://images.unsplash.com/photo-1610924125440-db821b18a56e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    title: "Hello coldly wonderfully",
    subTitle:
        "Greyhound divisively hello coldly wonderfully marginally far upon excluding.",
  ),
];

final List<Experience> experiences = [
  Experience(
    icon: Icon(Icons.call),
    title: "Assistente de apoio ao usuário (2016 - 2019)",
    subTitle: "Duração: 3 anos e 4 meses",
  ),
  Experience(
    icon: Icon(Icons.code),
    title: "Assistente de programação (2018 - 2020)",
    subTitle: "Duração: 2 anos e 4 meses",
  ),
  Experience(
    icon: Icon(Icons.code),
    title: "Desenvolvedor de software (2020 - )",
    subTitle: "Até o momento",
  ),
];
