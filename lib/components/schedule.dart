import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/providers/sheetsProvider.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key, required this.sheet, required this.title});
  final SheetData sheet;
  final String title;

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.sheet.filterByDay(widget.sheet.listOfDays, widget.title),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),

                    // the unit's code
                    Text(
                      snapshot.data![index][4],
                      style: GoogleFonts.notoSans(),
                    ),
                    Text(
                      snapshot.data![index][2],
                      style: GoogleFonts.notoSans(),
                    ),
                    // the unit name
                    Text(
                      snapshot.data![index][5],
                      style: GoogleFonts.notoSans(),
                      maxLines: 2,
                    ),

                    // the unit lecturer
                    Text(
                      snapshot.data![index][6],
                      style: GoogleFonts.notoSans(),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text("Error loading data");
        } else {
          return const Text('We wacha');
        }
      },
    );
  }
}
