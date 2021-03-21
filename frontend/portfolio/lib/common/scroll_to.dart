import 'package:flutter/cupertino.dart';

void scrollToPosition(double position, ScrollController scrollController) {
  scrollController.animateTo(position,
      duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
}
