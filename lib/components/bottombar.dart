import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();

    return Container(
      padding: const EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            '© ${date.year} | ${pDeveloperName.toUpperCase()}',
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
