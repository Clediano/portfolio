import 'package:flutter/material.dart';

const pDefaultPadding = 20.0;

const pCVLink =
    "https://drive.google.com/drive/folders/1o4I9g9sUx1lWxGL_isEaZd_3aZ2TXu38?usp=sharing";

const pGitHubLink = "https://github.com/Clediano";

const pDeveloperName = "Clediano";
const pDeveloperFullName = "Clediano Estefenon";

const ptLocale = Locale('pt');
const enLocale = Locale('en');

const startScreen = 'start_screen';
const aboutScreen = 'about_screen';
const experienceScreen = 'experience_screen';
const contactScreen = 'contact_screen';
const projectScreen = 'project_screen';

final pDefaultShadow = BoxShadow(
  offset: Offset(0, 50),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.15),
);

final pDefaultCardShadow = BoxShadow(
  offset: Offset(2, 7),
  blurRadius: 25,
  color: Colors.black.withOpacity(0.25),
);

const pDefaultOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);

final pLightTheme = ThemeData(
  useMaterial3: false,
  cardColor: Colors.blueGrey.shade50,
  highlightColor: Colors.deepPurpleAccent,
  primarySwatch: Colors.blueGrey,
  brightness: Brightness.light,
  fontFamily: 'Josefin Slab',
  bottomAppBarColor: Colors.blueGrey.shade900,
  iconTheme: IconThemeData(color: Colors.blueGrey),
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: Colors.white,
    cardColor: Colors.blueGrey.shade50,
    primarySwatch: Colors.blueGrey,
  ),
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    subtitle2: TextStyle(
      color: Colors.blueGrey[900],
    ),
    subtitle1: TextStyle(
      color: Colors.black,
    ),
    headline1: TextStyle(
      color: Colors.blueGrey[800],
    ),
  ),
);

final pDarkTheme = ThemeData(
  cardColor: Colors.black87,
  highlightColor: Colors.deepPurpleAccent,
  primarySwatch: Colors.blueGrey,
  brightness: Brightness.dark,
  fontFamily: 'Josefin Slab',
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.blueGrey.shade200),
  colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
      backgroundColor: Colors.blueGrey.shade900),
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    subtitle2: TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline1: TextStyle(
      color: Colors.white70,
    ),
  ),
);
