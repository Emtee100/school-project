import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/components/firebaseauthState.dart';
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

  bool _lastPage = false;

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
                height: 550,
                child: PageView(
                  controller: _controller,
                  children: const [ScreenOne(), ScreenTwo(), ScreenThree()],
                  onPageChanged: (value) {
                    if (value == 2) {
                      setState(() {
                        _lastPage = true;
                      });
                    } else {
                      setState(() {
                        _lastPage = false;
                      });
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            'Previous',
                            style: GoogleFonts.notoSans(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                          ))),
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
                  GestureDetector(
                      onTap: () {
                        _lastPage
                            ? Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const AuthPage();
                                },
                              ))
                            : _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 13.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            _lastPage ? 'Done' : 'Next',
                            style: GoogleFonts.notoSans(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                          )))
                ],
              ),
            ],
          ),
        ));
  }
@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
