import 'package:flutter/material.dart';
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
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index][5]),
                subtitle: Text(snapshot.data![index][3]),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text("Error loading data");
        } else {
          return Text('We wacha');
        }
      },
    );
  }
}
