import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/components/requestData.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:provider/provider.dart';

import '../components/filters.dart';
import '../providers/sheetsProvider.dart';

class Tc05 extends StatefulWidget {
  const Tc05({super.key});

  @override
  State<Tc05> createState() => _Tc03State();
}

class _Tc03State extends State<Tc05> {
  String title = 'TC 0-5/0-6';
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
    ),
    floatingActionButton: FloatingActionButton.extended(
        label: Text("Make request", style: GoogleFonts.notoSans(),),
        onPressed: () => showModalBottomSheet(
            showDragHandle: true,
            context: context,
            enableDrag: true,
            isScrollControlled: true,
            builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          'Make Lab Request',
                          style: GoogleFonts.notoSans(fontSize: 15),
                        ),
                        ChangeNotifierProvider(
                          create: (_)=> Firestoredata(),
                          child: const RequestFields())
                      ]),
                    ),
                  ),
                )),
      ),
    );
  }
}
