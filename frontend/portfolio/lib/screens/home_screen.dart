import 'dart:ui';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/common/data.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/avatar.dart';
import 'package:portfolio/components/bottombar.dart';
import 'package:portfolio/components/drawer_menu.dart';
import 'package:portfolio/components/info_text.dart';
import 'package:portfolio/components/scrollbar.dart';
import 'package:portfolio/components/topbar_content.dart';
import 'package:portfolio/constatants.dart';
import 'package:portfolio/models/Experience.dart';

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
    Size screenSize = MediaQuery.of(context).size;
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;
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
                                Text(
                                  "Olá, eu me chamo",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  "Clediano",
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
                                  "e sou desenvolvedor de software",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: 500,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        icon:
                                            Icon(Icons.cloud_download_outlined),
                                        label: Text(
                                          "BAIXAR CV",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
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
                                      SizedBox(width: 10),
                                      TextButton.icon(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          "assets/images/github.svg",
                                          color: isThemeDark
                                              ? Colors.white
                                              : Theme.of(context)
                                                  .primaryColorDark,
                                        ),
                                        label: Text(
                                          "VER GITHUB",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isThemeDark
                                                ? Theme.of(context)
                                                    .primaryColorLight
                                                : Theme.of(context)
                                                    .primaryColorDark,
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
                                              borderRadius:
                                                  BorderRadius.circular(25),
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize.height / 15,
                  ),
                  width: screenSize.width,
                  color: Theme.of(context).primaryColorLight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sobre mim',
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 1,
                        width: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                      Sobre(),
                    ],
                  ),
                ),
                // SizedBox(height: screenSize.height / 10),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize.height / 15,
                  ),
                  width: screenSize.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Contato',
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 1,
                        width: 50,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      Contato(),
                    ],
                  ),
                ),
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

class Sobre extends StatelessWidget {
  const Sobre({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      // padding: EdgeInsets.all(62),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Avatar(imageRadius: 75, imageSrc: "assets/images/person.jpeg"),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    "Olá, meu nome completo é",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Text(
                  "CLEDIANO ESTEFENON",
                  style: TextStyle(
                    fontSize: 48,
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "e sou um desenvolvedor full stack.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 540,
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text:
                      "Sou formado em ciencia da computação e pós-graduando em desenvolvimento de software com Java. Minha carreira na área iniciou em ",
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: isThemeDark
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                        fontSize: 20,
                      ),
                  children: [
                    TextSpan(
                      text: "2016",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: isThemeDark
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text:
                            ", trabalhando em uma empresa de desenvolvimento como assistente de apoio ao usuário. "),
                    TextSpan(
                      text: "Gosto dos desafios que a programaçao impõem, ",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: isThemeDark
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorDark,
                            fontSize: 20,
                          ),
                    ),
                    TextSpan(
                      text: "resolver uma dor ",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: isThemeDark
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "através de código ",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: isThemeDark
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorDark,
                            fontSize: 20,
                          ),
                    ),
                    TextSpan(
                      text:
                          "é tão satisfatório quanto beber uma xícara de café!",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: isThemeDark
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorDark,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ]),
              // textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: screenSize.height / 15),
          Text(
            'Experiência',
            // textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          SizedBox(height: 20),
          Column(
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
                                  color: Theme.of(context).primaryColorDark),
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
                type: 'Instagram',
                text: 'clediano.stf',
              ),
              SizedBox(height: 5),
              InfoText(
                type: 'Linkedin',
                text: 'https://www.linkedin.com/in/clediano-estefenon/',
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoText(
                type: 'Github',
                text: 'https://github.com/Clediano',
              ),
              SizedBox(height: 5),
              InfoText(
                type: 'Email',
                text: 'cledianoestefenon@gmail.com',
              )
            ],
          ),
        ],
      ),
    );
  }
}
