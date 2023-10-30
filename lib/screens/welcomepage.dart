import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
       // backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Welcome', style: TextStyle(color: Colors.white),)),
        body: Column(
          children: [
            SvgPicture.asset('assets/svg/pair_programming.svg')
          ],
        )
    );
  }
}