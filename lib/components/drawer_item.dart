import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItem extends StatefulWidget {
  final String title;
  final void Function() onClick;
  final bool isSelected;

  const DrawerItem({
    Key? key,
    this.title = "Title",
    required this.onClick,
    this.isSelected = false,
  }) : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  final List _isHovering = [false];

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Get.isDarkMode;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: widget.onClick,
            onHover: (value) {
              setState(() {
                value ? _isHovering[0] = true : _isHovering[0] = false;
              });
            },
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: isDarkTheme
                        ? Colors.white
                        : Theme.of(context).primaryColorLight,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering[0],
                  child: Container(
                    height: 2,
                    width: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
