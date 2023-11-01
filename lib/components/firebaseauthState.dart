import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klabs/screens/signInScreen.dart';

import '../screens/homepage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _FirebasaeAuthState();
}

class _FirebasaeAuthState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // is user logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          //is user logged out
          else {
            return const SignIn();
          }
        },
      ),
    );
  }
}
