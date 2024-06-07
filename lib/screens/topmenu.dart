import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrate_parallax_web/screens/web_menu.dart';

import '../constants.dart';
import '../widget/button.dart';

class TopMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 840),
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     SizedBox(
                          width: 100,
                          height: 70,
                          child: Image.asset(
                            "assets/images/logo.png",
                          )),
                      //SvgPicture.asset("assets/images/ace_logo.png"),
                      const Spacer(),
                     WebMenu(),
                      const Spacer(),
                      const ButtonWidget(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
