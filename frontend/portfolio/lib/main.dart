import 'package:flutter/material.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (dBrightness) {
        return dBrightness == Brightness.light
            ? ThemeData(
                accentColor: Colors.deepPurpleAccent,
                primarySwatch: Colors.blueGrey,
                backgroundColor: Colors.white,
                cardColor: Colors.blueGrey[50],
                fontFamily: 'Josefin Slab',
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
                bottomAppBarColor: Colors.blueGrey[900],
                iconTheme: IconThemeData(color: Colors.blueGrey),
                brightness: dBrightness,
              )
            : ThemeData(
                accentColor: Colors.deepPurpleAccent,
                primarySwatch: Colors.blueGrey,
                backgroundColor: Colors.blueGrey[900],
                cardColor: Colors.black87,
                fontFamily: 'Josefin Slab',
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
                bottomAppBarColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.blueGrey[200]),
                brightness: dBrightness,
              );
      },
      themedWidgetBuilder: (ctx, data) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfólio',
          theme: data,
          home: HomeScreen(),
        );
      },
    );
  }
}
