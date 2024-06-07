import 'package:flutter/material.dart';
import 'package:hydrate_parallax_web/SOFT_BALL.dart';
import 'package:hydrate_parallax_web/constants.dart';
import 'package:hydrate_parallax_web/screens/topmenu.dart';

import '../widget/button.dart';
import '../widget/soft_torch_effect.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            TopMenu(),
            Stack(
              children: [
                Container(
                  height: 650,
                  color: backgroundColor,
                  child: const Stack(
                    children: [
                      Positioned(
                        left: -120.0,
                        top: 100.0,
                        child: SoftTorchEffect(),
                      ),
                      Positioned(
                        right: -100.0,
                        bottom: 100.0,
                        child: SoftTorchEffect(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.68,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: lightGreenColorColor,
                    child: const Stack(
                      children: [
                        Positioned(
                          left: -120.0,
                          top: 100.0,
                          child: SoftTorchEffect(),
                        ),
                        Positioned(
                          right: -100.0,
                          bottom: 100.0,
                          child: SoftTorchEffect(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0.0,
                          child: SizedBox(
                            height: 200.0,
                            width: 125.0,
                            child: Image.asset("assets/images/bottle_cap.png"),
                          ),
                        ),
                        const Positioned(
                          top: 175.0,
                          child: Text(
                            "Elevate Hydration, Inspire Living – \nPure Essence in Every Drop.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 270.0,
                          child: Text(
                            "Hydration Elevated: Sip Excellence with Every Drop",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 300.0,
                          child: ButtonWidget(),
                        ),
                        Positioned(
                          top: 395.0,
                          //bottom: 100.0,
                          child: SizedBox(
                            height: 600.0,
                            child: Image.asset("assets/images/bottle_body.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      )),
    );
  }
}
