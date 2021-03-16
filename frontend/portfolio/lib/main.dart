import 'package:flutter/material.dart';
import 'package:portfolio/common/routes.dart';
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
        Routes.homePage: (context) => HomeScreen(),
        Routes.articlesPage: (context) => ArticleScreen(),
        Routes.projectsPage: (context) => ProjectScreen(),
        Routes.contactPage: (context) => ContactScreen(),
      },
    );
  }
}
