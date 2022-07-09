import 'package:evolve/constants/colour_scheme.dart';
import 'package:evolve/pages/onboarding/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transparent_image/transparent_image.dart';

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
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Positioned(
              child: PageView(
                controller: _introController,
                children: [
                  IntroCardOne(theme: theme),
                  IntroCardTwo(theme: theme),
                  IntroCardThree(theme: theme),
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
                    onTap: () => Get.to(() => const Login()),
                    child: Text(
                      "Skip",
                      style: theme.textTheme.bodyText1?.copyWith(
                          color: AppColours.greyTextColour, fontSize: 18),
                    )),
              ),
            )
          ])),
    );
  }
}

class IntroCardOne extends StatelessWidget {
  const IntroCardOne({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 400,
          child: Column(
            children: [
              SizedBox(
                  height: 220,
                  child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image:
                          const AssetImage("lib/assets/images/checklist.png"))),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Easily Log Routines",
                style: theme.textTheme.headline2,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 280,
                child: Text(
                    "With Evolve's simple and specially designed logging flow, logging routines accurately becomes less of a chore.",
                    style: theme.textTheme.subtitle1
                        ?.copyWith(color: AppColours.greyTextColour),
                    textAlign: TextAlign.center),
              ),
            ],
          )),
    );
  }
}

class IntroCardTwo extends StatelessWidget {
  const IntroCardTwo({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 400,
          child: Column(
            children: [
              SizedBox(
                  height: 220,
                  child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: const AssetImage(
                          "lib/assets/images/statistics.png"))),
              const SizedBox(
                height: 10,
              ),
              Text(
                "View your progress",
                style: theme.textTheme.headline2,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 280,
                child: Text(
                    "Detailed analytics and visual displays lets you view and understand your progress at a glance.",
                    style: theme.textTheme.subtitle1
                        ?.copyWith(color: AppColours.greyTextColour),
                    textAlign: TextAlign.center),
              ),
            ],
          )),
    );
  }
}

class IntroCardThree extends StatelessWidget {
  const IntroCardThree({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 450,
          child: Column(
            children: [
              SizedBox(
                  height: 220,
                  child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image:
                          const AssetImage("lib/assets/images/analytics.png"))),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Get personalised insights",
                style: theme.textTheme.headline2,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 280,
                child: Text(
                    "Evolve's algorithm makes predictions about your overall well-being based on your lifestyle patterns and provides you with personalised prompts.",
                    style: theme.textTheme.subtitle1
                        ?.copyWith(color: AppColours.greyTextColour),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const Login());
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColours.componentColour,
                ),
                child: Text(
                  "Get Started",
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: AppColours.secondaryTextColour,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}