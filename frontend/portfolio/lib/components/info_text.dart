import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoText extends StatelessWidget {
  final String title;
  final String text;
  final bool isClicable;
  final bool useTitleOnButton;

  InfoText({
    @required this.title,
    @required this.text,
    @required this.isClicable,
    this.useTitleOnButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '$title: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        isClicable
            ? TextButton.icon(
                onPressed: () {
                  launch(text, universalLinksOnly: true);
                },
                icon: Icon(
                  Icons.link,
                  color: Theme.of(context).primaryColorDark,
                ),
                label: Text(
                  useTitleOnButton ? title : text,
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
              )
            : SelectableText(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
      ],
    );
  }
}
