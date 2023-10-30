import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset('assets/svg/educator.svg', height: 400,),
           Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.5),
                child: Text(
                  "A system for all",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Text(
                  "Lecturers, class reps, and lab technicians working together to get you into the labs you need, when you need them.",
                  style: GoogleFonts.notoSans(),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}