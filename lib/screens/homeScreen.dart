// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:klabs/screens/homepage.dart';
import 'package:klabs/screens/labScreen.dart';
import 'package:klabs/screens/profile.dart';
import 'package:klabs/screens/requestPage.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
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
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.computer), label: "Labs"),
            NavigationDestination(icon: FaIcon(FontAwesomeIcons.codePullRequest,size: 20), label: 'Requests'),
            NavigationDestination(
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
