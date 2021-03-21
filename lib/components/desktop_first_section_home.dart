import 'package:flutter/material.dart';
import 'package:portfolio/constatants.dart';

class DesktopFirstSectionHome extends StatelessWidget {
  final Function verGithub;
  final Function baixarCV;

  const DesktopFirstSectionHome({
    Key key,
    @required this.verGithub,
    @required this.baixarCV,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      key: key,
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
            width: screenSize.width * 0.5,
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
                              baixarCV();
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
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
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
                              verGithub();
                            },
                            icon: Icon(
                              Icons.explore,
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
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
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
  }
}
