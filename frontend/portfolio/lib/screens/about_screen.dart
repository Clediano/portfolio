import 'package:flutter/material.dart';
import 'package:portfolio/components/avatar.dart';
import 'package:portfolio/constatants.dart';

class Sobre extends StatelessWidget {
  const Sobre({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;

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
                    fontSize: 45,
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
        ],
      ),
    );
  }
}
