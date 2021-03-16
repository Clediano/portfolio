import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/common/routes.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    String _routeName = ModalRoute.of(context).settings.name;
    bool _isHomePage = _routeName == Routes.homePage;

    if (Responsive.isDesktop(context)) {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _isHomePage ? Colors.transparent : Color(0xFF202020),
        elevation: _isHomePage ? 0.0 : 4.0,
        title: _isHomePage
            ? Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/linkedin.svg",
                      width: 25,
                      height: 25,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/instagram.svg",
                      width: 25,
                      height: 25,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/twitter.svg",
                      width: 25,
                      height: 25,
                    ),
                    onPressed: () {},
                  )
                ],
              )
            : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
        actions: [
          Row(
            children: [
              SizedBox(width: 50),
              MenuItem(
                title: "Home",
                isSelected: _isHomePage,
                onClick: () {
                  Navigator.pushNamed(context, Routes.homePage);
                },
              ),
              SizedBox(width: 50),
              MenuItem(
                title: "Articles",
                isSelected: _routeName == Routes.articlesPage,
                onClick: () {
                  Navigator.pushNamed(context, Routes.articlesPage);
                },
              ),
              SizedBox(width: 50),
              MenuItem(
                title: "Projects",
                isSelected: _routeName == Routes.projectsPage,
                onClick: () {
                  Navigator.pushNamed(context, Routes.projectsPage);
                },
              ),
              SizedBox(width: 50),
              MenuItem(
                title: "Contact me",
                isSelected: _routeName == Routes.projectsPage,
                onClick: () {
                  Navigator.pushNamed(context, Routes.projectsPage);
                },
              ),
              SizedBox(width: 50),
              IconButton(
                icon: Icon(Icons.brightness_6),
                color: _isHomePage ? Colors.black : Colors.white,
                onPressed: () {},
              ),
              SizedBox(width: 20),
            ],
          )
        ],
      );
    } else {
      return AppBar(
        backgroundColor: _isHomePage ? Colors.transparent : Color(0xFF202020),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            color: Colors.white,
          ),
        ],
        title: Text(
          'CLEDIANO',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Josefin Slab',
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
          ),
        ),
      );
    }
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    this.onClick,
    this.isSelected = false,
    this.title = "Home",
  }) : super(key: key);

  final Function onClick;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    bool _isHomePage = ModalRoute.of(context).settings.name == Routes.homePage;

    return DecoratedBox(
      decoration: isSelected
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: _isHomePage ? Colors.black : Colors.white,
                  width: 2,
                ),
              ),
            )
          : BoxDecoration(
              border: Border(
                bottom: BorderSide.none,
              ),
            ),
      child: TextButton(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          shadowColor: Colors.transparent,
          primary: _isHomePage ? Colors.black : Colors.white,
          onSurface: Colors.transparent,
          padding: EdgeInsets.all(7),
        ),
        onPressed: onClick,
      ),
    );
  }
}
