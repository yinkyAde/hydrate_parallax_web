import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydrate_parallax_web/widget/icon_and_text.dart';

import 'constants.dart';

class BottleBg extends StatelessWidget {
  const BottleBg({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: lightGreenColorColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.transparent,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconAndText(iconName: "assets/icons/hand.svg", text:"Sustainable & bpa free",),
                    SizedBox(height: defaultPadding * 4.0,),
                    IconAndText(iconName: "assets/icons/droplet.svg", text:"Lightweight",),
                    SizedBox(height: defaultPadding * 4.0,),
                    IconAndText(iconName: "assets/icons/recycle.svg", text:"Liftime warranty",),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  "assets/images/bottle_bg.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
