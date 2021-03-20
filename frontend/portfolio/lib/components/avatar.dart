import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double imageRadius;
  final String imageSrc;

  const Avatar({
    Key key,
    @required this.imageRadius,
    @required this.imageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isThemeDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            isThemeDark
                ? Theme.of(context).accentColor
                : Theme.of(context).primaryColorDark,
            isThemeDark
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).primaryColorLight
          ],
        ),
      ),
      child: CircleAvatar(
        radius: imageRadius,
        backgroundImage: AssetImage(imageSrc),
      ),
    );
  }
}
