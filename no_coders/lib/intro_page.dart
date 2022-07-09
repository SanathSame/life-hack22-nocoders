import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_coders/leaderboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'constants/app_colours.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'constants/app_colours.dart';
// import 'login_page.dart';

// class IntroPage extends StatefulWidget {
//   const IntroPage({super.key});

//   @override
//   State<IntroPage> createState() => _IntroPageState();
// }

// class _IntroPageState extends State<IntroPage> {
//   final PageController _introController =
//       PageController(viewportFraction: 0.96, initialPage: 0);

//   double _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _currentPage = 0;
//     _introController.addListener(() {
//       setState(() {
//         _currentPage = _introController.page!;
//       });
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Positioned(
              child: PageView(
                controller: _introController,
                children: [
                  IntroCardOne(),
                  IntroCardTwo(),
                  IntroCardThree(),
                ],
              ),
            ),
            Positioned.fill(
              top: 500,
              child: Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: _introController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      dotColor: AppColours.greyBackgroundColor,
                      activeDotColor: AppColours.componentColour,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 2),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: (_currentPage.round() < 2) ? 1 : 0,
                child: GestureDetector(
                    onTap: () => Get.to(() => LeaderboardScreen()),
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ),
            )
          ])),
    );
  }
}

class IntroCardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center
    (
      child: SizedBox(
          height: 400,
          child: Column(
            children: [
              SizedBox(
                  height: 150, child: Image.asset('lib/assets/people_recycle.png')),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Easily Log Routines",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 280,
                child: Text(
                    "With Evolve's simple and specially designed logging flow, logging routines accurately becomes less of a chore.",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.center),
              ),],),),);
  }
}

class IntroCardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 400,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                    height: 220,
                    child: Image.asset('lib/assets/recycling_logo.jpg')),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "View your progress",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 280,
                  child: Text(
                      "Detailed analytics and visual displays lets you view and understand your progress at a glance.",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          )),
    );
  }
}

class IntroCardThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 450,
          child: Column(
            children: [
              SizedBox(
                  height: 150,
                  child: Image.asset('lib/assets/recycling_logo.jpg')),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Get personalised insights",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                width: 150,
                child: Text(
                    "Evolve's algorithm makes predictions about your overall well-being based on your lifestyle patterns and provides you with personalised prompts.",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/leaderboard');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  "Scan!",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),)
            ]
          )),
    );
  }
}
