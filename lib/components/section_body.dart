import 'package:flutter/material.dart';

class SectionBody extends StatelessWidget {
  const SectionBody({
    Key? key,
    required this.title,
    required this.body,
    required this.textColor,
    required this.titleColor,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Color textColor;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height / 15,
      ),
      width: screenSize.width,
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 40,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 1,
            width: 50,
            color: textColor,
          ),
          body,
        ],
      ),
    );
  }
}
