import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/common/scroll_to.dart';
import 'package:portfolio/components/logotipo.dart';
import 'package:portfolio/components/topbar_item.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  final double opacity;
  final ScrollController scrollController;
  final GlobalKey keyInicio;
  final GlobalKey keySobre;
  final GlobalKey keyExperiencia;
  final GlobalKey keyContato;

  const Appbar({
    Key key,
    @required this.opacity,
    @required this.scrollController,
    this.keyInicio,
    this.keySobre,
    this.keyExperiencia,
    this.keyContato,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  final List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;
    Size screenSize = MediaQuery.of(context).size;
    bool isSmallScreen = !Responsive.isDesktop(context);

    if (isSmallScreen) {
      return AppBar(
        backgroundColor:
            Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: isThemeDark
                ? Colors.white
                : widget.opacity > 0.4
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
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
          ),
        ],
        title: Logotipo(isThemeDark: isThemeDark, opacity: widget.opacity),
      );
    } else {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        elevation: widget.opacity,
        title: Logotipo(isThemeDark: isThemeDark, opacity: widget.opacity),
        actions: [
          TopbarItem(
            title: "Início",
            opacity: widget.opacity,
            isHovering: _isHovering[0],
            onHover: (value) {
              setState(() {
                value ? _isHovering[0] = true : _isHovering[0] = false;
              });
            },
            onClick: () {
              scrollToPosition(widget.keyInicio, widget.scrollController);
            },
          ),
          SizedBox(width: 20),
          TopbarItem(
            title: "Sobre mim",
            opacity: widget.opacity,
            isHovering: _isHovering[1],
            onHover: (value) {
              setState(() {
                value ? _isHovering[1] = true : _isHovering[1] = false;
              });
            },
            onClick: () {
              scrollToPosition(widget.keySobre, widget.scrollController);
            },
          ),
          SizedBox(width: 20),
          TopbarItem(
            title: "Experiência",
            opacity: widget.opacity,
            isHovering: _isHovering[2],
            onHover: (value) {
              setState(() {
                value ? _isHovering[2] = true : _isHovering[2] = false;
              });
            },
            onClick: () {
              scrollToPosition(widget.keyExperiencia, widget.scrollController);
            },
          ),
          SizedBox(width: 20),
          TopbarItem(
            title: "Contato",
            opacity: widget.opacity,
            isHovering: _isHovering[3],
            onHover: (value) {
              setState(() {
                value ? _isHovering[3] = true : _isHovering[3] = false;
              });
            },
            onClick: () {
              scrollToPosition(widget.keyContato, widget.scrollController);
            },
          ),
          SizedBox(width: screenSize.width - 800),
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
      );
    }
  }
}
