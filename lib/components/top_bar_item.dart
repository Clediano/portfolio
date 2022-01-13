import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants.dart';

class TopBarItem extends StatelessWidget {
  final void Function(bool) onHover;
  final void Function() onClick;
  final double opacity;
  final bool isHovering;
  final String title;

  const TopBarItem({
    Key? key,
    required this.onHover,
    required this.opacity,
    required this.isHovering,
    required this.title,
    required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Get.isDarkMode;
    Color colorButton =
        opacity > 0.4 ? Theme.of(context).primaryColorLight : Colors.black87;

    return InkWell(
      hoverColor: Colors.transparent,
      enableFeedback: true,
      excludeFromSemantics: true,
      onHover: (value) {
        onHover(value);
      },
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: pDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isDarkTheme ? Colors.white : colorButton,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 3),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: isHovering,
              child: Container(
                height: 2,
                width: 20,
                color: isDarkTheme ? Colors.white : colorButton,
              ),
            )
          ],
        ),
      ),
    );
  }
}
