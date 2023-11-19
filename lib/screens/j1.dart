import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/filters.dart';
import '../providers/sheetsProvider.dart';

class J1 extends StatefulWidget {
  const J1({super.key});

  @override
  State<J1> createState() => _Tc03State();
}

class _Tc03State extends State<J1> {
  String title = 'J1';
  @override
  Widget build(BuildContext context) {
  final int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: DecoratedBox(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [Colors.black38, Colors.transparent])),
                position: DecorationPosition.foreground,
                child: Hero(
                  tag: 'image $index',
                  child: Stack(fit: StackFit.expand, children: [
                    Image.asset(
                      'assets/images/tc-01.jpg',
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              title,
                              style: GoogleFonts.notoSans(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Capacity: 60',
                              style: GoogleFonts.notoSans(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20)
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
          ChangeNotifierProvider(
              create: (_) => SheetData(),
              child: Filters(
                title: title,
              ))
        ],
      ),
    ));
  }
}