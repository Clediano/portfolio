import 'package:flutter/material.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/info_text.dart';
import 'package:portfolio/constants.dart';

class Contact extends StatelessWidget {
  const Contact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);

    if (isDesktop) {
      return Container(
        key: key,
        margin: EdgeInsets.all(pDefaultPadding),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoText(
                  title: 'Instagram',
                  text: 'https://www.instagram.com/e.clediano',
                  isClickable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Linkedin',
                  text: 'https://www.linkedin.com/in/clediano-estefenon/',
                  isClickable: true,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoText(
                  title: 'Github',
                  text: 'https://github.com/Clediano',
                  isClickable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'E-mail',
                  text: 'cledianoestefenon@gmail.com',
                  isClickable: false,
                )
              ],
            ),
          ],
        ),
      );
    } else if (isTablet) {
      return Container(
        key: key,
        margin: EdgeInsets.all(pDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                InfoText(
                  title: 'Instagram',
                  text: 'https://www.instagram.com/e.clediano',
                  isClickable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Linkedin',
                  text: 'https://www.linkedin.com/in/clediano-estefenon',
                  isClickable: true,
                ),
                InfoText(
                  title: 'Github',
                  text: 'https://github.com/Clediano',
                  isClickable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'E-mail',
                  text: 'cledianoestefenon@gmail.com',
                  isClickable: false,
                )
              ],
            ),
          ],
        ),
      );
    } else {
      return Container(
        key: key,
        margin: EdgeInsets.all(pDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                InfoText(
                  title: 'Instagram',
                  useTitleOnButton: true,
                  text: 'https://www.instagram.com/clediano.stf',
                  isClickable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Linkedin',
                  useTitleOnButton: true,
                  text: 'https://www.linkedin.com/in/clediano-estefenon',
                  isClickable: true,
                ),
                InfoText(
                  title: 'Github',
                  useTitleOnButton: true,
                  text: 'https://github.com/Clediano',
                  isClickable: true,
                ),
                SizedBox(height: 5),
                InfoText(
                  title: 'Email',
                  useTitleOnButton: true,
                  text: 'cledianoestefenon@gmail.com',
                  isClickable: false,
                )
              ],
            ),
          ],
        ),
      );
    }
  }
}
