import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            '© 2021 | CLEDIANO',
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
