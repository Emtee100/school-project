import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/components/schedule.dart';
import 'package:klabs/providers/sheetsProvider.dart';
import 'package:provider/provider.dart';

class Filters extends StatefulWidget {
  const Filters({super.key, required this.title});
  final String title;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  List<String> days = ['Monday'];
  List<String> daysOfTheWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<SheetData>(
        builder: (context, value, child) => SliverToBoxAdapter(
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
                      style: GoogleFonts.notoSans(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                        height: 145,
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: FilterChip(
                                //selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                                showCheckmark: true,
                                backgroundColor: Colors.transparent,
                                selectedColor: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                label: Text(
                                  daysOfTheWeek[0],
                                  style: GoogleFonts.notoSans(),
                                ),
                                selected: isSelected1,
                                onSelected: (variable) {
                                  setState(() {
                                    isSelected1 = variable;
                                  });
                                  if (isSelected1 == true) {
                                    value
                                        .addDay(daysOfTheWeek[0].toUpperCase());
                                  } else {
                                    value.removeDay(
                                        daysOfTheWeek[0].toUpperCase());
                                  }
                                  print(isSelected1);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: FilterChip(
                                //selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                                showCheckmark: isSelected2,
                                backgroundColor: Colors.transparent,
                                selectedColor: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                label: Text(
                                  daysOfTheWeek[1],
                                  style: GoogleFonts.notoSans(),
                                ),
                                selected: isSelected2,
                                onSelected: (variable) {
                                  setState(() {
                                    isSelected2 = variable;
                                  });
                                  if (isSelected2 == true) {
                                    value
                                        .addDay(daysOfTheWeek[1].toUpperCase());
                                  } else {
                                    value.removeDay(
                                        daysOfTheWeek[1].toUpperCase());
                                  }
                                  print(isSelected2);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: FilterChip(
                                selectedColor: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                showCheckmark: true,
                                backgroundColor: Colors.transparent,
                                label: Text(
                                  daysOfTheWeek[2],
                                  style: GoogleFonts.notoSans(),
                                ),
                                selected: isSelected3,
                                onSelected: (variable) {
                                  setState(() {
                                    isSelected3 = variable;
                                  });
                                  if (isSelected3 == true) {
                                    value
                                        .addDay(daysOfTheWeek[2].toUpperCase());
                                  } else {
                                    value.removeDay(
                                        daysOfTheWeek[2].toUpperCase());
                                  }
                                  print(isSelected3);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: FilterChip(
                                selectedColor: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                showCheckmark: true,
                                backgroundColor: Colors.transparent,
                                label: Text(
                                  daysOfTheWeek[3],
                                  style: GoogleFonts.notoSans(),
                                ),
                                selected: isSelected4,
                                onSelected: (variable) {
                                  setState(() {
                                    isSelected4 = variable;
                                  });
                                  if (isSelected4 == true) {
                                    value
                                        .addDay(daysOfTheWeek[3].toUpperCase());
                                  } else {
                                    value.removeDay(
                                        daysOfTheWeek[3].toUpperCase());
                                  }
                                  print(isSelected4);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: FilterChip(
                                selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                                showCheckmark: true,
                                backgroundColor: Colors.transparent,
                                label: Text(
                                  daysOfTheWeek[4],
                                  style: GoogleFonts.notoSans(),
                                ),
                                selected: isSelected5,
                                onSelected: (variable) {
                                  setState(() {
                                    isSelected5 = variable;
                                  });
                                  if (isSelected5 == true) {
                                    value
                                        .addDay(daysOfTheWeek[4].toUpperCase());
                                  } else {
                                    value.removeDay(
                                        daysOfTheWeek[4].toUpperCase());
                                  }
                                  print(isSelected5);
                                },
                              ),
                            ),
                          ],
                        )),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    height: 600,
                    child: Schedule(
                      sheet: value,
                      title: widget.title,
                    ),
                  ),
                ],
              ),
            ));
  }
}
