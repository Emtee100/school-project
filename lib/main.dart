import 'package:flutter/material.dart';
import 'package:klabs/Themes/Themes.dart';
import 'package:klabs/screens/welcomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: klabsTheme.lightTheme,
      darkTheme: klabsTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen()
    );
  }
}

