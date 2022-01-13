import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/models/offset_screen.dart';
import 'package:portfolio/store/store.dart';

class GetBoxOffset extends StatefulWidget {
  final Widget child;
  final String screen;

  const GetBoxOffset({
    Key? key,
    required this.child,
    required this.screen,
  }) : super(key: key);

  @override
  _GetBoxOffsetState createState() => _GetBoxOffsetState();
}

class _GetBoxOffsetState extends State<GetBoxOffset> {
  final GlobalKey widgetKey = GlobalKey();
  final store = Get.put(Store());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final box = widgetKey.currentContext?.findRenderObject() as RenderBox;
      store.addOffsetScreen(OffsetScreen(
        screenName: widget.screen,
        offset: box.localToGlobal(Offset.zero),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
