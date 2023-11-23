import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ThirdPartySignIn extends StatefulWidget {
  const ThirdPartySignIn({super.key});

  @override
  State<ThirdPartySignIn> createState() => _ThirdPartySignInState();
}

class _ThirdPartySignInState extends State<ThirdPartySignIn> {
  Future<UserCredential> signInWithGoogle() async {
    showDialog(
        barrierDismissible: false,
        barrierColor: Colors.black26,
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ));
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    if (context.mounted) {
      Navigator.pop(context);
    }
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => signInWithGoogle(),
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
