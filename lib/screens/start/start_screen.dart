import 'package:flutter/material.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/screens/start/components/desktop.dart';
import 'package:portfolio/screens/start/components/mobile.dart';
import 'package:portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  void _openCV() {
    launch(pCVLink, universalLinksOnly: true);
  }

  void _openGithub() {
    launch(pGitHubLink, universalLinksOnly: true);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    if (isDesktop) {
      return DesktopFirstSectionHome(
        key: key,
        openCV: _openCV,
        openGithub: _openGithub,
      );
    } else {
      return MobileFirstSectionHome(
        key: key,
        openGithub: _openGithub,
        openCV: _openCV,
      );
    }
  }
}
