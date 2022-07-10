import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_coders/scan_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'constants/app_colours.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _introController =
      PageController(viewportFraction: 0.96, initialPage: 0);

  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _introController.addListener(() {
      setState(() {
        _currentPage = _introController.page!;
      });
    });
  }

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
                      activeDotColor: Color(0xff73937e),
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
                    onTap: () => Get.to(() => ScanPage()),
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 150, child: Image.asset('assets/people_recycle.png')),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Know your recyclables",
            style: TextStyle(
                color: Color(0xff454955),
                fontSize: 18,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 280,
            child: Text(
                "Check whether your item is recyclable in one scan. Our proprietary technology will be able to identify your items with accuracy and precision.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: "Open Sans",
                ),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class IntroCardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.8,
                child: SizedBox(
                    height: 220,
                    child: Image.asset('assets/recycling_logo.jpg')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Showcase your environmental awareness",
              style: TextStyle(
                  color: Color(0xff454955),
                  fontSize: 18,
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              width: 280,
              child: Text(
                  "Compete with your peers at our leaderboard to win attractive prizes and be rewarded for doing your part to conserve the environment.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: "Open Sans",
                  ),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}

class IntroCardThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.8,
            child: SizedBox(
                height: 220, child: Image.asset('assets/recycling_logo.jpg')),
          ),
        ),
        const Text(
          "Ever-improving technology",
          style: TextStyle(
              color: Color(0xff454955),
              fontSize: 18,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          width: 300,
          child: Text(
              "Our system will become better with each of your scan and our machine learning algorithmn will be able to detect your items faster with increased precision.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: "Open Sans",
              ),
              textAlign: TextAlign.center),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/scan');
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF73937E),
          ),
          child: const Text(
            "Scan!",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontFamily: "Open Sans"),
          ),
        )
      ]),
    );
  }
}
