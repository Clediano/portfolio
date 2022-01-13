import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/constants.dart';

class MobileFirstSectionHome extends StatelessWidget {
  final void Function() openGithub;
  final void Function() openCV;

  const MobileFirstSectionHome({
    Key? key,
    required this.openGithub,
    required this.openCV,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Get.isDarkMode;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isTablet = Responsive.isTablet(context);
    final bool isMobile = Responsive.isMobile(context);

    return Column(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: screenSize.height * 0.1),
          child: SizedBox(
            height: screenSize.height * 0.40,
            width: screenSize.width,
            child: Image.asset(
              "assets/images/programmer.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.50,
          width: screenSize.width,
          child: Padding(
            padding: EdgeInsets.only(right: screenSize.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isMobile)
                  Text(
                    AppLocalizations.of(context)!.startMessage1,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: 26),
                    textAlign: TextAlign.end,
                  ),
                if (isTablet)
                  Text(
                    AppLocalizations.of(context)!.startMessage1,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.end,
                  ),
                Text(
                  pDeveloperName,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        letterSpacing: 3,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.end,
                ),
                if (isMobile)
                  Text(
                    AppLocalizations.of(context)!.startMessage2,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: 25),
                    textAlign: TextAlign.end,
                  ),
                if (isTablet)
                  Text(
                    AppLocalizations.of(context)!.startMessage2,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                const SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => openCV(),
                        icon: const Icon(Icons.cloud_download_outlined),
                        label: Text(
                          AppLocalizations.of(context)!
                              .startButtonCV
                              .toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: pDefaultPadding * 0.8,
                            vertical: pDefaultPadding * 0.8,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      TextButton.icon(
                        onPressed: () => openGithub(),
                        icon: Icon(
                          Icons.explore,
                          color: isDarkTheme
                              ? Theme.of(context).primaryColorLight
                              : Theme.of(context).primaryColorDark,
                        ),
                        label: Text(
                          AppLocalizations.of(context)!
                              .startButtonGitHub
                              .toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkTheme
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColorDark,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                              color: isDarkTheme
                                  ? Theme.of(context).primaryColorLight
                                  : Theme.of(context).primaryColorDark,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: pDefaultPadding * 0.8,
                            vertical: pDefaultPadding * 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
