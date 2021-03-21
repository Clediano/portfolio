import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/common/data.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/appbar.dart';
import 'package:portfolio/components/bottombar.dart';
import 'package:portfolio/components/desktop_first_section_home.dart';
import 'package:portfolio/components/drawer_menu.dart';
import 'package:portfolio/components/info_text.dart';
import 'package:portfolio/components/mobile_first_section_home.dart';
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

  GlobalKey _keyInicio = GlobalKey();
  GlobalKey _keySobre = GlobalKey();
  GlobalKey _keyExperiencia = GlobalKey();
  GlobalKey _keyContato = GlobalKey();

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

  void _calcularOpacidadeTopbar() {
    var screenSize = MediaQuery.of(context).size;

    if (_scrollPosition < screenSize.height * 0.40) {
      _opacity = _scrollPosition / (screenSize.height * 0.40);
    } else {
      _opacity = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;

    _calcularOpacidadeTopbar();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: Appbar(
        opacity: _opacity,
        scrollController: _scrollController,
        keyInicio: _keyInicio,
        keySobre: _keySobre,
        keyExperiencia: _keyExperiencia,
        keyContato: _keyContato,
      ),
      drawer: DrawerMenu(
        scrollController: _scrollController,
        keyInicio: _keyInicio,
        keySobre: _keySobre,
        keyExperiencia: _keyExperiencia,
        keyContato: _keyContato,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            FirstSectionHome(key: _keyInicio),
            SectionBody(
              key: _keySobre,
              title: "Sobre mim",
              backgroundColor: Theme.of(context).primaryColorLight,
              textColor: Theme.of(context).primaryColorDark,
              titleColor: Theme.of(context).primaryColorDark,
              body: Sobre(),
            ),
            SectionBody(
              key: _keyExperiencia,
              title: "Experiência",
              textColor: isThemeDark
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColorDark,
              titleColor: isThemeDark
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColorDark,
              body: Experiencia(),
            ),
            SectionBody(
              key: _keyContato,
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
    );
  }
}

class FirstSectionHome extends StatelessWidget {
  const FirstSectionHome({Key key}) : super(key: key);

  void _baixarCV() {
    launch(
      "https://drive.google.com/file/d/1MJ3ELdHuXZPO-lmpFVnjff4WiNhAeOzy/view?usp=sharing",
      universalLinksOnly: true,
    );
  }

  void _verGithub() {
    launch(
      "https://github.com/Clediano",
      universalLinksOnly: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    if (isDesktop) {
      return DesktopFirstSectionHome(
        key: key,
        baixarCV: _baixarCV,
        verGithub: _verGithub,
      );
    } else {
      return MobileFirstSectionHome(
        verGithub: _verGithub,
        baixarCV: _baixarCV,
        key: key,
      );
    }
  }
}

class SectionBody extends StatelessWidget {
  const SectionBody({
    Key key,
    @required this.title,
    @required this.body,
    @required this.textColor,
    @required this.titleColor,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Color textColor;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
      key: key,
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
        key: key,
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
                  title: 'E-mail',
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
        key: key,
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
                  title: 'E-mail',
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
        key: key,
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
