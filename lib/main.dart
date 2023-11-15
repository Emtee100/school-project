import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:klabs/Themes/Themes.dart';
import 'package:klabs/firebase_options.dart';
import 'package:klabs/screens/TC%200-1.dart';
import 'package:klabs/screens/TC%200-3.dart';
import 'package:klabs/screens/TC%200-5.dart';
import 'package:klabs/screens/TC%200-7.dart';
import 'package:klabs/screens/daLab.dart';
import 'package:klabs/screens/j1.dart';
import 'package:klabs/screens/j2.dart';
import 'package:klabs/screens/welcomepage.dart';
import 'package:klabs/transitions/customRoute.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'TC 0-1/TC 0-2': (context)=> const Tc01(),
        'TC 0-3':(context) => const Tc03(),
        'TC 0-5/TC 0-6':(context) => const Tc05(),
        'TC 0-7/TC 0-8':(context) => const Tc07(),
        'J1':(context) => const J1(),
        'J2':(context) => const J2(),
        'DA LAB':(context) => const DaLab(),
      },
      title: 'K.L.A.B.S',
      theme: klabsTheme.lightTheme,
      darkTheme: klabsTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen()
    );
  }
}

