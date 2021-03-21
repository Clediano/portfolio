import 'package:flutter/material.dart';
import 'package:portfolio/constatants.dart';

class TopbarItem extends StatelessWidget {
  final Function onHover;
  final Function onClick;
  final double opacity;
  final bool isHovering;
  final String title;

  const TopbarItem({
    Key key,
    this.onHover,
    @required this.opacity,
    this.isHovering,
    @required this.title,
    @required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;
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
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isThemeDark ? Colors.white : colorButton,
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
                color: isThemeDark ? Colors.white : colorButton,
              ),
            )
          ],
        ),
      ),
    );
  }
}
