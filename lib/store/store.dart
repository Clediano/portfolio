import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/shared_preferences.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/models/offset_screen.dart';

class Store extends GetxController {
  var menuOpacity = 0.0.obs;
  var scrollPosition = 0.0.obs;
  late ScrollController _scrollController;
  List<OffsetScreen> _offsetScreen = [];

  double get getMenuOpacity => this.menuOpacity.value;
  ScrollController get getScrollController => this._scrollController;
  List<OffsetScreen> get getAllOffsetScreen => this._offsetScreen;

  void setMenuOpacity(double opacity) {
    this.menuOpacity.value = opacity;
  }

  void setScrollPosition(double position) {
    this.scrollPosition.value = position;
  }

  void setScrollController(ScrollController scrollController) {
    this._scrollController = scrollController;
  }

  void addOffsetScreen(OffsetScreen screenOffset) {
    this._offsetScreen.add(screenOffset);
  }

  @override
  void onInit() {
    super.onInit();
    getPrefsTheme().then((value) {
      if (value! == "light") {
        Get.changeTheme(pLightTheme);
      } else {
        Get.changeTheme(pDarkTheme);
      }
    });

    getPrefsDefaultSystemLocale().then((value) {
      if (value! == "pt") {
        Get.updateLocale(ptLocale);
      } else {
        Get.updateLocale(enLocale);
      }
    });
  }
}
