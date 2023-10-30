import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset('assets/svg/educator.svg', height: 400,),
          const Text("Third pageview"),
        ],
      ),
    );
  }
}