import 'package:flutter/material.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/bottom_bar_column.dart';
import 'package:portfolio/components/info_text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: !Responsive.isDesktop(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: "",
                      s3: "",
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Instagram',
                      s2: 'Linkedin',
                      s3: '',
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                InfoText(
                  type: 'Email',
                  text: 'cledianoestefenon@gmail.com',
                ),
                SizedBox(height: 5),
                InfoText(
                  type: 'Address',
                  text: '450, Edgar Mondadori, Maravilha, SC - 89874000',
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Text(
                  '© 2021 | CLEDIANO',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          : Row(
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
