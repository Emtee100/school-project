import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThirdPartySignIn extends StatelessWidget {
  const ThirdPartySignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            // onTap: () => signInWithGoogle(),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15)),
              child: SvgPicture.asset(
                "assets/svg/google.svg",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: SvgPicture.asset(
              "assets/svg/apple.svg",
            ),
          )
        ],
      ),
    );
  }
}
