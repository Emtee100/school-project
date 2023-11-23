// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:klabs/screens/labScreen.dart';
import 'package:klabs/screens/profile.dart';
import 'package:klabs/screens/requestPage.dart';
import 'package:klabs/screens/reviews.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  bool isLabTech =true;
  List<Widget> pages = [
    const LabScreen(),
    const Requests(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("K.L.A.B.S"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: ChangeNotifierProvider(
          create: (_) => Firestoredata(),
          child: pages[currentPage]),
        bottomNavigationBar: NavigationBar(
          destinations: [
           const  NavigationDestination(icon: Icon(Icons.computer), label: "Labs"),
            isLabTech? const NavigationDestination(icon: FaIcon(FontAwesomeIcons.codePullRequest,size: 20), label: 'Approvals'): const NavigationDestination(icon: FaIcon(FontAwesomeIcons.codePullRequest,size: 20), label: 'Requests'),
           const NavigationDestination(
                icon: Icon(Icons.account_circle), label: "Account")
          ],
          selectedIndex: currentPage,
          onDestinationSelected: (value) {
            setState(() {
              currentPage = value;
            });
          },
        ));
  }
}
