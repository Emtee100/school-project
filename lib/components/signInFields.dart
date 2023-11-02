import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/components/thirdPartySignIn.dart';
import 'package:klabs/screens/signUpScreen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late GlobalKey<FormState> _loginFormKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _invalidEmailError = false;
  bool _passwordError = false;
  @override
  void initState() {
    // TODO: implement initState
    _loginFormKey = GlobalKey();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  Future signInMethod() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        setState(() => _passwordError = true);
      } else if (e.code == 'invalid-email') {
        setState(() => _invalidEmailError = true);
        print(e.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginFormKey,
        child: Column(children: [
          TextFormField(
            autofocus: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter an email address";
              }
              return null;
            },
            controller: _emailController,
            decoration: InputDecoration(
              errorText:
                  _invalidEmailError ? 'Please enter a valid email' : null,
              errorStyle: GoogleFonts.notoSans(),
              labelText: "Email Address",
              labelStyle: GoogleFonts.notoSans(),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.notoSans(),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _passwordController,
              decoration: InputDecoration(
                errorText: _passwordError ? "Wrong password" : null,
                errorStyle: GoogleFonts.notoSans(),
                labelText: "Password",
                labelStyle: GoogleFonts.notoSans(),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              style: GoogleFonts.notoSans(),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please a password";
                }
                return null;
              }),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              if (_loginFormKey.currentState!.validate()) {
                signInMethod();
              }
            },
            child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Text(
                "Log in",
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
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
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp())),
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
 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
