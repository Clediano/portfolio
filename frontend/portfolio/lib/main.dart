import 'package:flutter/material.dart';
import 'package:portfolio/screens/article_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfólio',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/articles': (context) => ArticleScreen(),
        '/projects': (context) => ProjectScreen(),
        '/contact': (context) => ContactScreen(),
      },
    );
  }
}
