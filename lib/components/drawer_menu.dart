import 'package:flutter/material.dart';
import 'package:portfolio/common/scroll_to.dart';
import 'package:portfolio/components/drawer_item.dart';
import 'package:portfolio/constatants.dart';

class DrawerMenu extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey keyInicio;
  final GlobalKey keySobre;
  final GlobalKey keyExperiencia;
  final GlobalKey keyContato;

  const DrawerMenu({
    Key key,
    this.scrollController,
    this.keyInicio,
    this.keySobre,
    this.keyExperiencia,
    this.keyContato,
  }) : super(key: key);

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
                title: "Início",
                onClick: () {
                  scrollToPosition(keyInicio, scrollController);
                },
              ),
              DrawerItem(
                title: "Sobre mim",
                onClick: () {
                  scrollToPosition(keySobre, scrollController);
                },
              ),
              DrawerItem(
                title: "Experiência",
                onClick: () {
                  scrollToPosition(keyExperiencia, scrollController);
                },
              ),
              DrawerItem(
                title: "Contato",
                onClick: () {
                  scrollToPosition(keyContato, scrollController);
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
