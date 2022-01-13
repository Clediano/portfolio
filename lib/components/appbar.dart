import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/common/scroll_to.dart';
import 'package:portfolio/common/shared_preferences.dart';
import 'package:portfolio/components/logotype.dart';
import 'package:portfolio/components/top_bar_item.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/l10n/l10n.dart';
import 'package:portfolio/store/store.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  final List _isHovering = [false, false, false, false];
  final store = Get.put(Store());

  void onChangeLocale(String? value) {
    if (value != null && value == "en") {
      Get.updateLocale(enLocale);
      setPrefsDefaultSystemLocale("en");
    } else {
      Get.updateLocale(ptLocale);
      setPrefsDefaultSystemLocale("pt");
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Get.isDarkMode;

    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = !Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);

    final Color textAppBarColor = store.getMenuOpacity > 0.4
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).primaryColorDark;

    final enFlag = L10n.getFlag('en');
    final ptFlag = L10n.getFlag('pt');

    final String deviceLocale = identical(Get.locale, enLocale) ? "en" : "pt";

    if (isSmallScreen) {
      return Obx(() {
        return AppBar(
          backgroundColor: Theme.of(context)
              .bottomAppBarColor
              .withOpacity(store.getMenuOpacity),
          elevation: 0,
          centerTitle: screenSize.width < 350 ? false : true,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: isDarkTheme ? Colors.white : textAppBarColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: pDefaultPadding / 3),
              child: DropdownButton(
                value: deviceLocale,
                underline: Container(),
                icon: Icon(
                  Icons.language,
                  color: isDarkTheme ? Colors.white : textAppBarColor,
                ),
                items: isTablet
                    ? [
                        _buildDropdownMenuItem(
                          "$ptFlag ${AppLocalizations.of(context)!.ptLanguage}",
                          "pt",
                        ),
                        _buildDropdownMenuItem(
                          "$enFlag ${AppLocalizations.of(context)!.enLanguage}",
                          "en",
                        ),
                      ]
                    : [
                        _buildDropdownMenuItem("pt", "pt"),
                        _buildDropdownMenuItem("en", "en"),
                      ],
                onChanged: (String? value) => onChangeLocale(value),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.brightness_6),
              highlightColor: Colors.transparent,
              color: isDarkTheme ? Colors.white : textAppBarColor,
              onPressed: () {
                if (isDarkTheme) {
                  Get.changeTheme(pLightTheme);
                  setPrefsTheme("light");
                } else {
                  Get.changeTheme(pDarkTheme);
                  setPrefsTheme("dark");
                }
              },
            ),
          ],
          title: Logotype(),
        );
      });
    } else {
      return Obx(() {
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context)
              .bottomAppBarColor
              .withOpacity(store.getMenuOpacity),
          elevation: 0,
          title: Logotype(),
          actions: [
            TopBarItem(
              title: AppLocalizations.of(context)!.appBarStart,
              opacity: store.getMenuOpacity,
              isHovering: _isHovering[0],
              onHover: (value) {
                setState(() {
                  value ? _isHovering[0] = true : _isHovering[0] = false;
                });
              },
              onClick: () => scrollToPosition(startScreen),
            ),
            const SizedBox(width: 20),
            TopBarItem(
              title: AppLocalizations.of(context)!.appBarAbout,
              opacity: store.getMenuOpacity,
              isHovering: _isHovering[1],
              onHover: (value) {
                setState(() {
                  value ? _isHovering[1] = true : _isHovering[1] = false;
                });
              },
              onClick: () => scrollToPosition(aboutScreen),
            ),
            const SizedBox(width: 20),
            TopBarItem(
              title: AppLocalizations.of(context)!.appBarExperience,
              opacity: store.getMenuOpacity,
              isHovering: _isHovering[2],
              onHover: (value) {
                setState(() {
                  value ? _isHovering[2] = true : _isHovering[2] = false;
                });
              },
              onClick: () => scrollToPosition(experienceScreen),
            ),
            const SizedBox(width: 20),
            TopBarItem(
              title: AppLocalizations.of(context)!.appBarContact,
              opacity: store.getMenuOpacity,
              isHovering: _isHovering[3],
              onHover: (value) {
                setState(() {
                  value ? _isHovering[3] = true : _isHovering[3] = false;
                });
              },
              onClick: () => scrollToPosition(contactScreen),
            ),
            SizedBox(width: screenSize.width - 850),
            Padding(
              padding: const EdgeInsets.all(pDefaultPadding / 3),
              child: DropdownButton(
                value: deviceLocale,
                underline: Container(),
                icon: Icon(
                  Icons.language,
                  color: isDarkTheme ? Colors.white : textAppBarColor,
                ),
                items: [
                  _buildDropdownMenuItem(
                    "$ptFlag ${AppLocalizations.of(context)!.ptLanguage}",
                    "pt",
                  ),
                  _buildDropdownMenuItem(
                    "$enFlag ${AppLocalizations.of(context)!.enLanguage}",
                    "en",
                  ),
                ],
                onChanged: (String? value) => onChangeLocale(value),
              ),
            ),
            const SizedBox(width: pDefaultPadding),
            IconButton(
              icon: const Icon(Icons.brightness_6),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: isDarkTheme
                  ? Colors.white
                  : store.getMenuOpacity > 0.4
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
              onPressed: () {
                if (isDarkTheme) {
                  Get.changeTheme(pLightTheme);
                  setPrefsTheme("light");
                } else {
                  Get.changeTheme(pDarkTheme);
                  setPrefsTheme("dark");
                }
              },
            ),
          ],
        );
      });
    }
  }

  DropdownMenuItem<String> _buildDropdownMenuItem(String text, String value) {
    return DropdownMenuItem(
      child: Padding(
        padding: EdgeInsets.only(right: pDefaultPadding / 2),
        child: Text(
          text,
          style: TextStyle(
            color:
                Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
      ),
      value: value,
    );
  }
}
