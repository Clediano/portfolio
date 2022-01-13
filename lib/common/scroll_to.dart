import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/models/offset_screen.dart';
import 'package:portfolio/store/store.dart';

void scrollToPosition(String screenName) {
  final store = Get.put(Store());

  double offset = store.getAllOffsetScreen
      .firstWhere((OffsetScreen element) => element.screenName == screenName)
      .offset
      .dy - 60;

  store.getScrollController.animateTo(
    offset,
    duration: const Duration(milliseconds: 500),
    curve: Curves.fastLinearToSlowEaseIn,
  );
}
