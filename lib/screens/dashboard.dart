import 'package:flutter/material.dart';
import 'package:hydrate_parallax_web/SOFT_BALL.dart';
import 'package:hydrate_parallax_web/constants.dart';
import 'package:hydrate_parallax_web/screens/topmenu.dart';

import '../test_bg.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Background containers and effects
              Stack(
                children: [
                  Column(
                    children: [
                      TopMenu(),
                      // First Container with backgroundColor
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
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
                      // Second Container with lightGreenColorColor
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        color: lightGreenColorColor,
                        child: const Stack(
                          children: [
                            BottleBg(),
                            Positioned(
                              left: 2000.0,
                              top: 100.0,
                              child: Placeholder(),
                            ),
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
                    ],
                  ),
                  // Image Container on top of the first two containers
                  Positioned(
                    top: 80.0,
                    left: 0.0,
                    right: 0.0,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150.0,
                            width: 125.0,
                            child: Image.asset("assets/images/bottle_cap.png"),
                          ),
                          const SizedBox(height: defaultPadding),
                          const Text(
                            "Elevate Hydration, Inspire Living – \nPure Essence in Every Drop.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CanelaDeck',
                              fontWeight: FontWeight.w600,
                              fontSize: 34.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            "Hydration Elevated: Sip Excellence with Every Drop",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CanelaDeck',
                              fontWeight: FontWeight.normal,
                              height: 2.0,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: defaultPadding/2.0),
                          const ButtonWidget(),
                          const SizedBox(height: defaultPadding * 2.0),
                          SizedBox(
                            height: 600.0,
                            child: Image.asset("assets/images/bottle_body.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
