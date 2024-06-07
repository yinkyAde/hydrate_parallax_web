import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding/2.0),
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2,horizontal: defaultPadding / 2),
      decoration: const BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.all(Radius.circular(defaultPadding * 2.0)),
      ),
      child: const Center(
        child: Text(
          "Shop Now",
          style: TextStyle(color: Colors.white,fontFamily: 'CanelaDeck'),
        ),
      ),
    );
  }
}
