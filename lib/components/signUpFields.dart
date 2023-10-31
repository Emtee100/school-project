import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/screens/signInScreen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late GlobalKey<FormState> _signUpFormKey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signUpFormKey = GlobalKey();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFormKey,
        child: Column(
      children: [
        TextFormField(
          autofocus: true,
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
          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please an email";
                          }
                          return null;
                        },
          decoration: InputDecoration(
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
          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your role";
                          }
                          else if(value!="Student" || value!="Technician" || value!="Lecturer"){
                            return "Only roles are student, technician or lecturer";
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
          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a password";
                          }
                          return null;
                        },
          decoration: InputDecoration(
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
          onTap: () {
            if(_signUpFormKey.currentState!.validate()){

            }
          },
           child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
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
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignIn())),
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
}
