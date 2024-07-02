import 'package:flutter/material.dart';
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

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {

  AnimationController? animationController;
  Animation<double>? textAndButtonAnimation;
  Animation<Offset>? textAndButtonOffsetAnimation;
  ScrollController? scrollController;
  double bottleHeightFactor = 0.8;

  double topPositionBottleCap = 300.0;
  double initialTopPositionBottleCap = 300.0;
  double middleTopPositionBottleCap = 75.0;
  double finalTopPositionBottleCap = 1300.0;

  double topPositionBottleBody = 350.0;
  double initialTopPositionBottleBody = 350.0;
  double middleTopPositionBottleBody = 550.0;
  double finalTopPositionBottleBody = 1350.0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController?.addListener(_scrollListener);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    textAndButtonAnimation = CurvedAnimation(
      parent: animationController!,
      curve: const Interval(0.20, 0.50),
    );

    // textAndButtonOffsetAnimation =
    //     Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.5))
    //         .animate(CurvedAnimation(
    //         parent: animationController!,
    //         curve: Curves.elasticIn
    //     ));
    // Start the animation and scroll when the animation completes
    animationController?.forward().whenComplete(() {
      scrollToBottom();
    });
  }

  @override
  void dispose() {
    scrollController?.removeListener(_scrollListener);
    scrollController?.dispose();
    animationController?.dispose();
    super.dispose();
  }


  void scrollToBottom() {
    scrollController?.animateTo(
      scrollController!.position.maxScrollExtent,
      duration: const Duration(seconds: 3),
      curve: Curves.easeInOut,
    );
  }

  double currentTopPositionBottleBody = 0.0 ;
  double currentTopPositionBottleCap = 0.0 ;

  void _scrollListener() {

    setState(() {
      double maxScrollExtent = scrollController!.position.maxScrollExtent;
      double currentScroll = scrollController!.offset;
      double scrollRatio = currentScroll / maxScrollExtent;
      //print("maxScrollExtent $maxScrollExtent");
      //print("currentScroll $currentScroll");
      bottleHeightFactor = 0.8 + (currentScroll / maxScrollExtent) * 0.2;

      // Interpolating top position value between 150 and 1000 based on scroll position
      if (scrollRatio < 0.5) {
        double progress = scrollRatio / 0.5;
        topPositionBottleBody = initialTopPositionBottleBody + (middleTopPositionBottleBody - initialTopPositionBottleBody) * progress;
        topPositionBottleCap = initialTopPositionBottleCap + (middleTopPositionBottleCap - initialTopPositionBottleCap) * progress;
        print("-----------CURRENT VALUE WHEN NOT SCROLLED--------------");
        print("middleTopPositionBottleCap   $middleTopPositionBottleCap");
        print("finalTopPositionBottleCap   $finalTopPositionBottleCap");
        print("progress   $progress");

        print("currentTopPositionBottleBody   $topPositionBottleBody");
        print("currentTopPositionBottleCap    $topPositionBottleCap");

      } else {
        double progress = (scrollRatio - 0.5) / 0.5;
        // topPositionBottleBody = middleTopPositionBottleBody + (finalTopPositionBottleBody - middleTopPositionBottleBody) * progress;
        // topPositionBottleCap = middleTopPositionBottleCap + (finalTopPositionBottleCap - middleTopPositionBottleCap) * progress;
        print("-----------CURRENT VALUE WHEN SCROLLED--------------");
        print("middleTopPositionBottleCap   $middleTopPositionBottleCap");
        print("finalTopPositionBottleCap   $finalTopPositionBottleCap");
        print("progress   $progress");
        print("currentTopPositionBottleBody   $topPositionBottleBody");
        print("currentTopPositionBottleCap    $topPositionBottleCap");
        topPositionBottleBody = interpolate(
          progress,
          middleTopPositionBottleBody,
          finalTopPositionBottleBody,
        );
        topPositionBottleCap = interpolate(
          progress,
          middleTopPositionBottleCap,
          finalTopPositionBottleCap,
        );
      }
      //print("topPosition $topPositionBottleBody");
    });
    //print("bottleHeightFactor $bottleHeightFactor");
  }

  double interpolate(double animationValue, double start, double end) {
    return start + (end - start) * animationValue;
  }



  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: animationController!,
      builder: (context,_){

        double currentTopPositionBottleBody = initialTopPositionBottleBody;
        double currentTopPositionBottleCap = initialTopPositionBottleCap;

        // Interpolate positions based on the textAndButtonAnimation value
        if (textAndButtonAnimation!.value < 1.0) {
          currentTopPositionBottleBody = interpolate(
            textAndButtonAnimation!.value,
            initialTopPositionBottleBody,
            middleTopPositionBottleBody,
          );
          currentTopPositionBottleCap = interpolate(
            textAndButtonAnimation!.value,
            initialTopPositionBottleCap,
            middleTopPositionBottleCap,
          );
        }
        else {
          // Handle scrolling after the scaling animation

          double maxScrollExtent = scrollController!.position.maxScrollExtent;
          double currentScroll = scrollController!.offset;
          double scrollRatio = currentScroll / maxScrollExtent;


          if (scrollRatio < 0.5) {
            double progress = scrollRatio * 2;
            currentTopPositionBottleBody = middleTopPositionBottleBody +
                (middleTopPositionBottleBody - initialTopPositionBottleBody) *
                    progress;
            currentTopPositionBottleCap = middleTopPositionBottleCap +
                (middleTopPositionBottleCap - initialTopPositionBottleCap) *
                    progress;
          } else {
            double progress = (scrollRatio - 0.5) * 2;
            currentTopPositionBottleBody = middleTopPositionBottleBody +
                (finalTopPositionBottleBody - middleTopPositionBottleBody) *
                    progress;
            currentTopPositionBottleCap = middleTopPositionBottleCap +
                (finalTopPositionBottleCap - middleTopPositionBottleCap) *
                    progress;
          }
        }

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
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
                            height: size.height,
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
                            height: size.height,
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
                      Positioned(
                        top: size.height * 0.3,
                        left: 0.0,
                        right: 0.0,
                        child: Center(
                          child: Column(
                            children: [
                              Transform.scale(
                                scale: textAndButtonAnimation!.value,
                                child: const Column(
                                  children: [
                                    Text(
                                      "Elevate Hydration, Inspire Living – \nPure Essence in Every Drop.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'CanelaDeck',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 40.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
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
                                    SizedBox(
                                        height: defaultPadding / 2.0),
                                    ButtonWidget(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Image Container on top of the first two containers
                      Positioned(
                        top: currentTopPositionBottleBody,
                        left: 0.0,
                        right: 0.0,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.8,
                                child: Image.asset("assets/images/bottle_body.png"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: currentTopPositionBottleCap,
                        left: 0.0,
                        right: 0.0,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200.0,
                                width: 150.0,
                                child: Image.asset("assets/images/bottle_cap.png"),
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
      },
    );
  }
}
