import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/providers/sheetsProvider.dart';
import 'package:provider/provider.dart';

class Tc01 extends StatefulWidget {
  const Tc01({
    super.key,
  });
  @override
  State<Tc01> createState() => _Tc01State();
}

class _Tc01State extends State<Tc01> {
  List<String> daysOfTheWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
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
                              'TC 0-1/TC 0-2',
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Schedule',
                    style: GoogleFonts.notoSans(fontSize: 25),
                  ),
                ),
                SizedBox(
                    height: 70,
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: FilterChip(
                            //selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                            showCheckmark: true,
                            backgroundColor: Colors.transparent,
                            label: Text(
                              'Monday',
                              style: GoogleFonts.notoSans(),
                            ),
                            selected: isSelected1,
                            onSelected: (value) {
                              setState(() {
                                isSelected1 = value;
                              });
                              print(isSelected1);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: FilterChip(
                            //selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                            showCheckmark: isSelected2,
                            backgroundColor: Colors.transparent,
                            label: Text(
                              'Tuesday',
                              style: GoogleFonts.notoSans(),
                            ),
                            selected: true,
                            onSelected: (value) {
                              setState(() {
                                isSelected2 = value;
                              });
                              print(isSelected2);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: FilterChip(
                            //selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                            showCheckmark: true,
                            backgroundColor: Colors.transparent,
                            label: Text(
                              'Wednesday',
                              style: GoogleFonts.notoSans(),
                            ),
                            selected: isSelected3,
                            onSelected: (value) {
                              setState(() {
                                isSelected3 = value;
                              });
                              print(isSelected3);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: FilterChip(
                            //selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                            showCheckmark: true,
                            backgroundColor: Colors.transparent,
                            label: Text(
                              'Thursday',
                              style: GoogleFonts.notoSans(),
                            ),
                            selected: isSelected4,
                            onSelected: (value) {
                              setState(() {
                                isSelected4 = value;
                              });
                              print(isSelected4);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: FilterChip(
                            //selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                            showCheckmark: true,
                            backgroundColor: Colors.transparent,
                            label: Text(
                              'Friday',
                              style: GoogleFonts.notoSans(),
                            ),
                            selected: isSelected5,
                            onSelected: (value) {
                              setState(() {
                                isSelected5 = value;
                              });
                              print(isSelected5);
                            },
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    )
        //     Column(children: [
        //   Hero(
        //       tag: 'image $index',
        //       child: Image.asset(
        //         'assets/images/tc-01.jpg',
        //         height: 400,
        //       )),
        //   Expanded(
        //     child: ChangeNotifierProvider(
        //         create: (_) => SheetData(), child: const ListRow()),
        //   )
        // ])

        );
  }
}

class ListRow extends StatefulWidget {
  const ListRow({
    super.key,
  });
  @override
  State<ListRow> createState() => _ListRowState();
}

class _ListRowState extends State<ListRow> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SheetData>(
        builder: (context, value, child) => Container(
              height: 100,
              child: FutureBuilder(
                future: value.allCleanRows,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data!.length.toString()),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Error loading data");
                  } else {
                    return Text('We wacha');
                  }
                },
              ),
            ));
  }
}
