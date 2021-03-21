import 'package:flutter/material.dart';
import 'package:portfolio/common/scroll_to.dart';
import 'package:portfolio/components/drawer_item.dart';
import 'package:portfolio/constatants.dart';

class DrawerMenu extends StatelessWidget {
  final ScrollController scrollController;

  const DrawerMenu({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF202020),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 1.5),
          child: Column(
            children: [
              DrawerItem(
                title: "Home",
                onClick: () {
                  scrollToPosition(0, scrollController);
                },
              ),
              DrawerItem(
                title: "Sobre mim",
                onClick: () {
                  scrollToPosition(800, scrollController);
                },
              ),
              DrawerItem(
                title: "Contato",
                onClick: () {
                  scrollToPosition(1511.6, scrollController);
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '© 2021 | CLEDIANO',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
