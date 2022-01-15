import 'package:flutter/material.dart';
import 'package:portfolio/components/avatar.dart';
import 'package:portfolio/constants.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(pDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Avatar(imageRadius: 75, imageSrc: "assets/images/person.jpeg"),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
