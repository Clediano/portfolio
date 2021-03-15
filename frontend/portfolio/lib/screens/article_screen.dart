import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/appbar.dart';
import 'package:portfolio/components/drawer_menu.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Appbar(),
      drawer: !Responsive.isDesktop(context) ? DrawerMenu() : null,
      body: Responsive(
        mobile: Center(child: Text("Article screen")),
        tablet: Center(child: Text("Article screen")),
        desktop: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/images/instagram.svg",
              width: 25,
              height: 25,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
