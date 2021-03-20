import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class TopbarContent extends StatefulWidget {
  final double opacity;

  TopbarContent(this.opacity);

  @override
  _TopbarContentsStat createState() => _TopbarContentsStat();
}

class _TopbarContentsStat extends State<TopbarContent> {
  final List _isHovering = [false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "< ",
                      style: TextStyle(
                        color: isThemeDark
                            ? Colors.white
                            : widget.opacity > 0.4
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColorDark,
                      ),
                    ),
                    TextSpan(
                      text: 'CLEDIANO',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        letterSpacing: 5,
                        fontSize: 22,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    TextSpan(
                      text: ' />',
                      style: TextStyle(
                        color: isThemeDark
                            ? Colors.white
                            : widget.opacity > 0.4
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    InkWell(
                      hoverColor: Colors.transparent,
                      enableFeedback: true,
                      excludeFromSemantics: true,
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {
                        print("cliequei SOBRE MIM");
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Sobre mim',
                            style: TextStyle(
                              color: isThemeDark
                                  ? Colors.white
                                  : widget.opacity > 0.4
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      hoverColor: Colors.transparent,
                      enableFeedback: true,
                      excludeFromSemantics: true,
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {
                        print("cliequei CONTATO");
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Contato',
                            style: TextStyle(
                              color: isThemeDark
                                  ? Colors.white
                                  : widget.opacity > 0.4
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.brightness_6),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: isThemeDark
                    ? Colors.white
                    : widget.opacity > 0.4
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColorDark,
                onPressed: () {
                  DynamicTheme.of(context).setBrightness(
                    isThemeDark ? Brightness.light : Brightness.dark,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
