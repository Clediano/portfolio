import 'package:flutter/cupertino.dart';

double _getPositionOfWidget(GlobalKey key, ScrollController scrollController) {
  final RenderBox render = key.currentContext.findRenderObject();
  Offset position = render.localToGlobal(Offset.zero);

  double scrollPosition = scrollController.position.pixels;

  /**Posição da barra de rolgem + quantos pixels falta para chegar até o widget que eu quero(pode ser negativo) - altura do Appbar */
  return scrollPosition + position.dy - 56;
}

void scrollToPosition(GlobalKey keyWidget, ScrollController scrollController) {
  scrollController.animateTo(_getPositionOfWidget(keyWidget, scrollController),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn);
}
