import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/appbar.dart';
import 'package:portfolio/components/avatar.dart';
import 'package:portfolio/components/drawer_menu.dart';
import 'package:portfolio/constatants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Appbar(),
      drawer: !Responsive.isDesktop(context) ? DrawerMenu() : null,
      body: Responsive(
        mobile: Avatar(),
        tablet: Avatar(),
        desktop: Row(
          children: [
            Expanded(
              child: Avatar(),
              flex: 6,
            ),
            Expanded(
              child: PersonInformation(),
              flex: 10,
            )
          ],
        ),
      ),
    );
  }
}

class PersonInformation extends StatelessWidget {
  const PersonInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      padding: EdgeInsets.all(62),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "CLEDIANO ESTEFENON",
                  style: TextStyle(
                    fontSize: 48,
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "FULL STACK DEVELOPER",
                  style: TextStyle(
                    fontSize: 30,
                    color: kSecondaryTextColor,
                    fontFamily: "Josefin Slab",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 500,
            child: Text(
              "Cientista da computação e pós-graduando em desenvolvimento de software com Java, sou entusiasta do mundo da programação. Tenho 22 anos de idade e 3 de experiência.",
              style: TextStyle(
                fontSize: 20,
                color: kTextColor,
                fontFamily: "Josefin Slab",
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.cloud_download_outlined),
                  label: Text("DOWNLOAD CV"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kSecondaryColor),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5,
                        vertical: kDefaultPadding * 0.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/images/github.svg",
                    color: Colors.black,
                  ),
                  label: Text(
                    "CHECK MY GITHUB",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.black12),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5,
                        vertical: kDefaultPadding * 0.8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
