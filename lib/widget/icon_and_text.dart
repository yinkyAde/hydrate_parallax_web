import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class IconAndText extends StatelessWidget {
  final String iconName;
  final String text;

  const IconAndText({super.key, required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.0,
          width: 40.0,
          child: SvgPicture.asset(iconName),
        ),
        const SizedBox(height: defaultPadding / 2.0),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'CanelaDeck',
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
