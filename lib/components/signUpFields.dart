// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/screens/homepage.dart';
import 'package:klabs/screens/signInScreen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _invalidEmail = false;
  bool _weakPassword = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Future <void> signUpMethod() async {
    try {
      // this method creates a user
      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        // this will set the invalid email boolean to true which will trigger the error text
        setState(() {
          _invalidEmail = true;
        });
      } else if (e.code == 'weak-password') {
        // this will set the weak password boolean to true which will trigger the error text
        setState(() {
          _weakPassword = true;
        });
      }
    }
  }

  Future<void> createUserRecord() async {
    await db.collection('users').doc().set(<String, dynamic>{
      'Full Name': _fullNameController.text.trim(),
      'Email': _emailController.text.trim(),
      'Role': _roleController.text.trim(),
    });
  }

  late GlobalKey<FormState> _signUpFormKey;
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _roleController;
  @override
  void initState() {
    super.initState();
    _signUpFormKey = GlobalKey();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _roleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _fullNameController,
              style: GoogleFonts.notoSans(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please your name";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Full Names",
                labelStyle: GoogleFonts.notoSans(),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please an email";
                }
                return null;
              },
              decoration: InputDecoration(
                errorText: _invalidEmail ? 'This email is not valid' : null,
                errorStyle: GoogleFonts.notoSans(),
                labelText: "Email Address",
                labelStyle: GoogleFonts.notoSans(),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              style: GoogleFonts.notoSans(),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _roleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your role";
                } else if (value != "Student" &&
                    value != 'Technician' &&
                    value != 'Lecturer') {
                  return "Only roles are Student, Technician or Lecturer";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Role",
                labelStyle: GoogleFonts.notoSans(),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              style: GoogleFonts.notoSans(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a password";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                errorText: _weakPassword ? 'Weak password' : null,
                errorStyle: GoogleFonts.notoSans(),
                labelText: "Password",
                labelStyle: GoogleFonts.notoSans(),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              style: GoogleFonts.notoSans(),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async{
                if (_signUpFormKey.currentState!.validate()) {
                  await signUpMethod();
                  await createUserRecord();
                }
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Text(
                  "Sign up",
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.notoSans(color: Colors.grey.shade700),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignIn())),
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.notoSans(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _roleController.dispose();
  }
}
