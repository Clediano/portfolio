import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/common/data.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/appbar.dart';
import 'package:portfolio/components/bottombar.dart';
import 'package:portfolio/components/drawer_menu.dart';
import 'package:portfolio/components/info_text.dart';
import 'package:portfolio/components/scrollbar.dart';
import 'package:portfolio/constatants.dart';
import 'package:portfolio/models/Experience.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
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
    Size screenSize = MediaQuery.of(context).size;
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;

    _calcularOpacidadeTopbar(screenSize);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: Appbar(
        opacity: _opacity,
        scrollController: _scrollController,
      ),
      drawer: DrawerMenu(
        scrollController: _scrollController,
      ),
      body: WebScrollbar(
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Responsive(
            desktop: Column(
              children: [
                FirstSectionHome(),
                SectionBody(
                  screenSize: screenSize,
                  title: "Sobre mim",
                  backgroundColor: Theme.of(context).primaryColorLight,
                  textColor: Theme.of(context).primaryColorDark,
                  titleColor: Theme.of(context).primaryColorDark,
                  body: Sobre(),
                ),
                SectionBody(
                  screenSize: screenSize,
                  title: "Experiência",
                  // backgroundColor: Theme.of(context).primaryColor,
                  textColor: isThemeDark
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
                  titleColor: isThemeDark
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
                  body: Experiencia(),
                ),
                SectionBody(
                  screenSize: screenSize,
                  title: "Contato",
                  backgroundColor: Theme.of(context).primaryColorLight,
                  textColor: Theme.of(context).primaryColorDark,
                  titleColor: Theme.of(context).primaryColorDark,
                  body: Contato(),
                ),
                BottomBar()
              ],
            ),
            tablet: Column(
              children: [
                FirstSectionHome(),
                SectionBody(
                  screenSize: screenSize,
                  title: "Sobre mim",
                  backgroundColor: Theme.of(context).primaryColorLight,
                  textColor: Theme.of(context).primaryColorDark,
                  titleColor: Theme.of(context).primaryColorDark,
                  body: Sobre(),
                ),
                SectionBody(
                  screenSize: screenSize,
                  title: "Experiência",
                  // backgroundColor: Theme.of(context).primaryColor,
                  textColor: isThemeDark
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
                  titleColor: isThemeDark
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
                  body: Experiencia(),
                ),
                SectionBody(
                  screenSize: screenSize,
                  title: "Contato",
                  backgroundColor: Theme.of(context).primaryColorLight,
                  textColor: Theme.of(context).primaryColorDark,
                  titleColor: Theme.of(context).primaryColorDark,
                  body: Contato(),
                ),
                BottomBar()
              ],
            ),
            mobile: Column(
              children: [
                FirstSectionHome(),
                SectionBody(
                  screenSize: screenSize,
                  title: "Sobre mim",
                  backgroundColor: Theme.of(context).primaryColorLight,
                  textColor: Theme.of(context).primaryColorDark,
                  titleColor: Theme.of(context).primaryColorDark,
                  body: Sobre(),
                ),
                SectionBody(
                  screenSize: screenSize,
                  title: "Experiência",
                  // backgroundColor: Theme.of(context).primaryColor,
                  textColor: isThemeDark
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
                  titleColor: isThemeDark
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
                  body: Experiencia(),
                ),
                SectionBody(
                  screenSize: screenSize,
                  title: "Contato",
                  backgroundColor: Theme.of(context).primaryColorLight,
                  textColor: Theme.of(context).primaryColorDark,
                  titleColor: Theme.of(context).primaryColorDark,
                  body: Contato(),
                ),
                BottomBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstSectionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    Size screenSize = MediaQuery.of(context).size;
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;

    if (isDesktop) {
      return Row(
        children: [
          Container(
            child: SizedBox(
              height: screenSize.height,
              width: screenSize.width * 0.5,
              child: Image.asset(
                "assets/images/programador.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: screenSize.height,
              width: isDesktop ? screenSize.width * 0.5 : screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Olá, eu me chamo",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        "Clediano",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              letterSpacing: 3,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        "e sou desenvolvedor de software",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                launch(
                                    "https://drive.google.com/file/d/1MJ3ELdHuXZPO-lmpFVnjff4WiNhAeOzy/view?usp=sharing",
                                    universalLinksOnly: true);
                              },
                              icon: Icon(
                                Icons.cloud_download_outlined,
                              ),
                              label: Text(
                                "BAIXAR CV",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding * 1.5,
                                    vertical: kDefaultPadding * 0.8,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton.icon(
                              onPressed: () {
                                launch("https://github.com/Clediano",
                                    universalLinksOnly: true);
                              },
                              icon: SvgPicture.asset(
                                "assets/images/github.svg",
                                color: isThemeDark
                                    ? Theme.of(context).primaryColorLight
                                    : Theme.of(context).primaryColorDark,
                              ),
                              label: Text(
                                "VER GITHUB",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isThemeDark
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark,
                                ),
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.black12,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: BorderSide(
                                      color: isThemeDark
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding * 1.5,
                                    vertical: kDefaultPadding * 0.8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else if (isTablet) {
      return Positioned(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.1),
              child: SizedBox(
                height: screenSize.height * 0.40,
                width: screenSize.width,
                child: Image.asset(
                  "assets/images/programador.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              child: SizedBox(
                height: screenSize.height * 0.50,
                width: screenSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Olá, eu me chamo",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          "Clediano",
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                letterSpacing: 3,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "e sou desenvolvedor de software",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 500,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cloud_download_outlined,
                                ),
                                label: Text(
                                  "BAIXAR CV",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
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
                                  color: isThemeDark
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark,
                                ),
                                label: Text(
                                  "VER GITHUB",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isThemeDark
                                        ? Theme.of(context).primaryColorLight
                                        : Theme.of(context).primaryColorDark,
                                  ),
                                ),
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black12,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                        color: isThemeDark
                                            ? Theme.of(context)
                                                .primaryColorLight
                                            : Theme.of(context)
                                                .primaryColorDark,
                                      ),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding * 1.5,
                                      vertical: kDefaultPadding * 0.8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Positioned(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.1),
              child: SizedBox(
                height: screenSize.height * 0.40,
                width: screenSize.width,
                child: Image.asset(
                  "assets/images/programador.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              child: SizedBox(
                height: screenSize.height * 0.50,
                width: screenSize.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Olá, eu me chamo",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          "Clediano",
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                letterSpacing: 3,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "e sou desenvolvedor de software",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 320,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cloud_download_outlined,
                                ),
                                label: Text(
                                  "BAIXAR CV",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding * 1,
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
                                  color: isThemeDark
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark,
                                ),
                                label: Text(
                                  "VER GITHUB",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isThemeDark
                                        ? Theme.of(context).primaryColorLight
                                        : Theme.of(context).primaryColorDark,
                                  ),
                                ),
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black12,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                        color: isThemeDark
                                            ? Theme.of(context)
                                                .primaryColorLight
                                            : Theme.of(context)
                                                .primaryColorDark,
                                      ),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding * 1,
                                      vertical: kDefaultPadding * 0.8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class SectionBody extends StatelessWidget {
  const SectionBody({
    Key key,
    @required this.screenSize,
    @required this.title,
    @required this.body,
    @required this.textColor,
    @required this.titleColor,
    this.backgroundColor,
  }) : super(key: key);

  final Size screenSize;
  final String title;
  final Widget body;
  final Color textColor;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height / 15,
      ),
      width: screenSize.width,
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 40,
              color: titleColor,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 1,
            width: 50,
            color: textColor,
          ),
          body,
        ],
      ),
    );
  }
}

class Experiencia extends StatelessWidget {
  const Experiencia({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          ...Iterable<int>.generate(experiences.length).map(
            (int index) {
              Experience experiencia = experiences.elementAt(index);
              return SizedBox(
                width: 500,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [kDefaultCardShadow],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: experiencia.icon,
                          title: Text(
                            experiencia.title,
                            maxLines: 2,
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            experiencia.subTitle,
                            maxLines: 1,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    if (!(index == experiences.length - 1))
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          child: VerticalDivider(
                            color: Theme.of(context).primaryColorDark,
                          ),
                          height: 30,
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Contato extends StatelessWidget {
  const Contato({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);

    if (isDesktop) {
      return Container(
        margin: EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoText(
                  title: 'Instagram',
                  text: 'https://www.instagram.com/clediano.stf',
                  isClicable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Linkedin',
                  text: 'https://www.linkedin.com/in/clediano-estefenon/',
                  isClicable: true,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoText(
                  title: 'Github',
                  text: 'https://github.com/Clediano',
                  isClicable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Email',
                  text: 'cledianoestefenon@gmail.com',
                  isClicable: false,
                )
              ],
            ),
          ],
        ),
      );
    } else if (isTablet) {
      return Container(
        margin: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                InfoText(
                  title: 'Instagram',
                  text: 'https://www.instagram.com/clediano.stf',
                  isClicable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Linkedin',
                  text: 'https://www.linkedin.com/in/clediano-estefenon',
                  isClicable: true,
                ),
                InfoText(
                  title: 'Github',
                  text: 'https://github.com/Clediano',
                  isClicable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Email',
                  text: 'cledianoestefenon@gmail.com',
                  isClicable: false,
                )
              ],
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                InfoText(
                  title: 'Instagram',
                  useTitleOnButton: true,
                  text: 'https://www.instagram.com/clediano.stf',
                  isClicable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Linkedin',
                  useTitleOnButton: true,
                  text: 'https://www.linkedin.com/in/clediano-estefenon',
                  isClicable: true,
                ),
                InfoText(
                  title: 'Github',
                  useTitleOnButton: true,
                  text: 'https://github.com/Clediano',
                  isClicable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Email',
                  useTitleOnButton: true,
                  text: 'cledianoestefenon@gmail.com',
                  isClicable: false,
                )
              ],
            ),
          ],
        ),
      );
    }
  }
}
