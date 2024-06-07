import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants.dart';
import '../controller/MenuAppController.dart';

class WebMenu extends StatelessWidget {
  final MenuAppController _controller = Get.put(MenuAppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          _controller.menuItems.length,
          (index) => WebMenuItem(
            text: _controller.menuItems[index],
            isActive: index == _controller.selectedIndex,
            press: () => _controller.setMenuIndex(index),
          ),
        ),
      ),
    );
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem({
    super.key,
    required this.isActive,
    required this.text,
    required this.press,
  });

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  _WebMenuItemState createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return accentColor.withOpacity(0.9);
    } else if (!widget.isActive & _isHover) {
      return accentColor.withOpacity(0.2);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 2),
        decoration: BoxDecoration(
         // color: _borderColor(),
          //borderRadius: BorderRadius.circular(defaultPadding / 2.0),
          // border: Border(
          //   bottom: BorderSide(color: _borderColor(), width: 3),
          // ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isActive ? Colors.white : Colors.grey,
            fontWeight: widget.isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
