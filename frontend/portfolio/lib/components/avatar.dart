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
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorDark
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
