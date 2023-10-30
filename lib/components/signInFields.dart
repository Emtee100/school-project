import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/components/thirdPartySignIn.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late GlobalKey _loginFormKey;
  @override
  void initState() {
    // TODO: implement initState
    _loginFormKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginFormKey,
        child: Column(children: [
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: "Email Address",
              labelStyle: GoogleFonts.notoSans(),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: GoogleFonts.notoSans(),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Text(
              "Log in",
              style: GoogleFonts.notoSans(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "or login with",
                style: GoogleFonts.notoSans(),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Divider(
                color: Theme.of(context).colorScheme.onSurface,
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const ThirdPartySignIn(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: GoogleFonts.notoSans(color: Colors.grey.shade700),
              ),
              GestureDetector(
                // onTap: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const SignUpForm())),
                child: Text(
                  "Register",
                  style: GoogleFonts.notoSans(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ]));
  }
}
