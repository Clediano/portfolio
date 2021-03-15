import 'package:flutter/material.dart';
import 'package:portfolio/components/drawer_item.dart';
import 'package:portfolio/constatants.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.name);
    return Drawer(
      child: Container(
        color: Color(0xFF010000),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 1.5),
          child: Column(
            children: [
              DrawerItem(
                title: "HOME",
                isSelected: ModalRoute.of(context).settings.name == "/",
                onClick: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
              DrawerItem(
                title: "ARTICLES",
                isSelected: ModalRoute.of(context).settings.name == "/articles",
                onClick: () {
                  Navigator.pushNamed(context, "/articles");
                },
              ),
              DrawerItem(
                title: "PROJECTS",
                isSelected: ModalRoute.of(context).settings.name == "/projects",
                onClick: () {
                  Navigator.pushNamed(context, "/projects");
                },
              ),
              DrawerItem(
                title: "CONTACT",
                isSelected: ModalRoute.of(context).settings.name == "/contact",
                onClick: () {
                  Navigator.pushNamed(context, "/contact");
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2021 | CLEDIANO',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}