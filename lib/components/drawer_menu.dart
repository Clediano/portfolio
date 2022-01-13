import 'package:flutter/material.dart';
import 'package:portfolio/common/scroll_to.dart';
import 'package:portfolio/components/drawer_item.dart';
import 'package:portfolio/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  _closeDrawer(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();

    return Drawer(
      child: Container(
        color: Color(0xFF202020),
        child: Padding(
          padding: const EdgeInsets.all(pDefaultPadding * 1.5),
          child: Column(
            children: [
              DrawerItem(
                title: AppLocalizations.of(context)!.appBarStart,
                onClick: () {
                  scrollToPosition(startScreen);
                  _closeDrawer(context);
                },
              ),
              DrawerItem(
                title: AppLocalizations.of(context)!.appBarAbout,
                onClick: () {
                  scrollToPosition(aboutScreen);
                  _closeDrawer(context);
                },
              ),
              DrawerItem(
                title: AppLocalizations.of(context)!.appBarExperience,
                onClick: () {
                  scrollToPosition(experienceScreen);
                  _closeDrawer(context);
                },
              ),
              DrawerItem(
                title: AppLocalizations.of(context)!.appBarContact,
                onClick: () {
                  scrollToPosition(contactScreen);
                  _closeDrawer(context);
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '© ${date.year} | ${pDeveloperName.toUpperCase()}',
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
