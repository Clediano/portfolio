import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/store/store.dart';

class Logotype extends StatelessWidget {
  final store = Get.put(Store());

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Get.isDarkMode;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "< ",
            style: TextStyle(
              color: isDarkTheme
                  ? Colors.white
                  : store.getMenuOpacity > 0.4
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
            ),
          ),
          TextSpan(
            text: pDeveloperName.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w200,
              letterSpacing: 1.5,
              fontSize: 17,
              color: Theme.of(context).highlightColor,
            ),
          ),
          TextSpan(
            text: ' />',
            style: TextStyle(
              color: isDarkTheme
                  ? Colors.white
                  : store.getMenuOpacity > 0.4
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
