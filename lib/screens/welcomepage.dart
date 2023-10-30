import 'package:flutter/material.dart';
import 'package:klabs/components/onboardingScreen1.dart';
import 'package:klabs/components/onboardingScreen2.dart';
import 'package:klabs/components/onboardingScreen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                height: 500,
                child: PageView(
                  controller: _controller,
                  children: const [ScreenOne(), ScreenTwo(), ScreenThree()],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Previous'),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: JumpingDotEffect(
                        activeDotColor: Theme.of(context).colorScheme.primary,
                        dotColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        dotHeight: 12,
                        dotWidth: 12),
                  ),
                  const Text('Next')
                ],
              ),
            ],
          ),
        ));
  }
}
