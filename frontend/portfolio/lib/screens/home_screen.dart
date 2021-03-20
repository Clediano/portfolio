import 'dart:ui';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/avatar.dart';
import 'package:portfolio/components/bottombar.dart';
import 'package:portfolio/components/drawer_menu.dart';
import 'package:portfolio/components/scrollbar.dart';
import 'package:portfolio/components/topbar_content.dart';
import 'package:portfolio/constatants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _calcularOpacidadeTopbar(screenSize) {
    var screenSize = MediaQuery.of(context).size;

    if (_scrollPosition < screenSize.height * 0.40) {
      _opacity = _scrollPosition / (screenSize.height * 0.40);
    } else {
      _opacity = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    _calcularOpacidadeTopbar(screenSize);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    DynamicTheme.of(context).setBrightness(
                      Theme.of(context).brightness == Brightness.dark
                          ? Brightness.light
                          : Brightness.dark,
                    );
                  },
                ),
              ],
              title: Text(
                'CLEDIANO',
                style: Theme.of(context).primaryTextTheme.subtitle2.copyWith(
                      fontSize: 20,
                      letterSpacing: 3,
                    ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopbarContent(_opacity),
            ),
      drawer: DrawerMenu(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.1,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Responsive(
            desktop: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: SizedBox(
                            height: screenSize.height,
                            width: screenSize.width * 0.5,
                            child: Image.asset(
                              "assets/images/programador.png",
                              fit: BoxFit.scaleDown,
                              height: 768,
                              width: 1024,
                            ),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            height: screenSize.height,
                            width: screenSize.width * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Avatar(),
                                Text(
                                  "Olá, eu me chamo",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  "Clediano,",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(
                                        letterSpacing: 3,
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "sou desenvolvedor de software",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  "e entusiasta de interfaces de usuários",
                                  style: Theme.of(context).textTheme.headline4,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: screenSize.height / 15,
                  ),
                  width: screenSize.width,
                  // color: Colors.black,
                  child: Text(
                    'Articles',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Josefin Slab',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height / 10),
                BottomBar()
              ],
            ),
            mobile: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding,
                ),
                width: screenSize.width,
                // color: Colors.black,
                child: Text(
                  'Articles',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Josefin Slab',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            tablet: Text("tablet"),
          ),
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
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "FULL STACK DEVELOPER",
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).accentColor,
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
                color: Theme.of(context).accentColor,
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
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).accentColor),
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
