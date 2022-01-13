import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/avatar.dart';
import 'package:portfolio/constants.dart';

class About extends StatelessWidget {
  const About({
    Key? key,
  }) : super(key: key);

  TextSpan buildSimpleTextSpan(
      BuildContext context, bool isDarkTheme, String text,
      {List<InlineSpan>? children}) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: isDarkTheme
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColorDark,
            fontSize: 20,
          ),
      children: children,
    );
  }

  TextSpan buildBoldSimpleTextSpan(
    BuildContext context,
    bool isDarkTheme,
    String text,
  ) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: isDarkTheme
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColorDark,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Get.isDarkMode;

    return Container(
      margin: EdgeInsets.all(pDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Avatar(imageRadius: 75, imageSrc: "assets/images/person.jpeg"),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: pDefaultPadding,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.aboutMessage1,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Text(
                  pDeveloperFullName.toUpperCase(),
                  style: TextStyle(
                    fontSize: 45,
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.aboutMessage2,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 540,
            child: RichText(
              textAlign: TextAlign.justify,
              text: buildSimpleTextSpan(
                context,
                isDarkTheme,
                AppLocalizations.of(context)!.aboutMessage3,
                children: [
                  buildBoldSimpleTextSpan(
                    context,
                    isDarkTheme,
                    AppLocalizations.of(context)!.aboutMessage4,
                  ),
                  buildSimpleTextSpan(
                    context,
                    isDarkTheme,
                    AppLocalizations.of(context)!.aboutMessage5,
                  ),
                  buildBoldSimpleTextSpan(
                    context,
                    isDarkTheme,
                    AppLocalizations.of(context)!.aboutMessage6,
                  ),
                  buildSimpleTextSpan(
                    context,
                    isDarkTheme,
                    AppLocalizations.of(context)!.aboutMessage7,
                  ),
                  buildSimpleTextSpan(
                    context,
                    isDarkTheme,
                    AppLocalizations.of(context)!.aboutMessage8,
                  ),
                  buildBoldSimpleTextSpan(
                    context,
                    isDarkTheme,
                    AppLocalizations.of(context)!.aboutMessage9,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
