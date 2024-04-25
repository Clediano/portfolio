import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants.dart';

class DesktopFirstSectionHome extends StatelessWidget {
  final Function openGithub;
  final Function openCV;

  const DesktopFirstSectionHome({
    Key? key,
    required this.openGithub,
    required this.openCV,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isDarkTheme = Get.isDarkMode;

    return Row(
      key: key,
      children: [
        Container(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width * 0.5,
            child: Image.asset(
              "assets/images/programmer.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.startMessage1,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      pDeveloperName,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            letterSpacing: 3,
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      AppLocalizations.of(context)!.startMessage2,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              openCV();
                            },
                            icon: Icon(
                              Icons.cloud_download_outlined,
                            ),
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
                            onPressed: () {
                              openGithub();
                            },
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
