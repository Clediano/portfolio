import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Function onClick;
  final bool isSelected;

  const DrawerItem({
    Key key,
    this.title = "Title",
    @required this.onClick,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: isSelected
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white70,
                    width: 1,
                  ),
                ),
              )
            : BoxDecoration(
                border: Border(
                  bottom: BorderSide.none,
                ),
              ),
        child: Row(
          mainAxisAlignment:
              isSelected ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: onClick,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 16,
                  fontFamily: 'Josefin Slab',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
