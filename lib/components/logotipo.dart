import 'package:flutter/material.dart';

class Logotipo extends StatelessWidget {
  const Logotipo({
    Key key,
    @required this.isThemeDark,
    @required double opacity,
  })  : _opacity = opacity,
        super(key: key);

  final bool isThemeDark;
  final double _opacity;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "< ",
            style: TextStyle(
              color: isThemeDark
                  ? Colors.white
                  : _opacity > 0.4
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
            ),
          ),
          TextSpan(
            text: 'CLEDIANO',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              letterSpacing: 3,
              fontSize: 22,
              color: Theme.of(context).accentColor,
            ),
          ),
          TextSpan(
            text: ' />',
            style: TextStyle(
              color: isThemeDark
                  ? Colors.white
                  : _opacity > 0.4
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
