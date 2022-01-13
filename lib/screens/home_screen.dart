import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/GetBoxOffset.dart';
import 'package:portfolio/components/appbar.dart';
import 'package:portfolio/components/bottombar.dart';
import 'package:portfolio/components/drawer_menu.dart';
import 'package:portfolio/components/section_body.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/start/start_screen.dart';
import 'package:portfolio/store/store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final store = Get.put(Store());

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    store.setScrollController(_scrollController);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  _scrollListener() {
    final _scrollPosition = _scrollController.position.pixels;
    final _heightScreen = MediaQuery.of(context).size.height * 0.40;

    if (_scrollPosition < _heightScreen) {
      store.setMenuOpacity(_scrollPosition / _heightScreen);
    } else {
      store.setMenuOpacity(1);
    }
    store.setScrollPosition(_scrollController.position.pixels);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Get.isDarkMode;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: Appbar(),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            GetBoxOffset(
              child: const FirstSectionHomeScreen(),
              screen: startScreen,
            ),
            GetBoxOffset(
              child: SectionBody(
                title: AppLocalizations.of(context)!.appBarAbout,
                backgroundColor: Theme.of(context).primaryColorLight,
                textColor: Theme.of(context).primaryColorDark,
                titleColor: Theme.of(context).primaryColorDark,
                body: const About(),
              ),
              screen: aboutScreen,
            ),
            GetBoxOffset(
              child: SectionBody(
                title: AppLocalizations.of(context)!.appBarExperience,
                textColor: isDarkTheme
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).primaryColorDark,
                titleColor: isDarkTheme
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).primaryColorDark,
                backgroundColor: isDarkTheme
                    ? Theme.of(context).backgroundColor
                    : Colors.white,
                body: const ExperienceScreen(),
              ),
              screen: experienceScreen,
            ),
            GetBoxOffset(
              child: SectionBody(
                title: AppLocalizations.of(context)!.appBarContact,
                backgroundColor: Theme.of(context).primaryColorLight,
                textColor: Theme.of(context).primaryColorDark,
                titleColor: Theme.of(context).primaryColorDark,
                body: const Contact(),
              ),
              screen: contactScreen,
            ),
            const BottomBar()
          ],
        ),
      ),
    );
  }
}
