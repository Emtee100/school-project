import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:provider/provider.dart';

class RequestFields extends StatefulWidget {
  const RequestFields({super.key});

  @override
  State<RequestFields> createState() => _RequestFieldsState();
}

class _RequestFieldsState extends State<RequestFields> {
  late GlobalKey<FormState> _requestDataKey;
  late TextEditingController labName;
  late TextEditingController unit;
  late TextEditingController newTime;
  late TextEditingController reason;
  @override
  void initState() {
    super.initState();
    _requestDataKey = GlobalKey<FormState>();
    labName = TextEditingController();
    unit = TextEditingController();
    newTime = TextEditingController();
    reason = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Firestoredata>(
      builder: (context, value, child) => Form(
        key: _requestDataKey,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: labName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter the Lab name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'E.g TC 0-1/TC 0-2',
                    hintStyle: GoogleFonts.notoSans(),
                    labelText: 'Lab Name',
                    labelStyle: GoogleFonts.notoSans(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                style: GoogleFonts.notoSans(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: unit,
                decoration: InputDecoration(
                    hintText: 'E.g Data Structures and Algorithms',
                    hintStyle: GoogleFonts.notoSans(),
                    labelText: 'Unit',
                    labelStyle: GoogleFonts.notoSans(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                style: GoogleFonts.notoSans(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter the unit name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: newTime,
                decoration: InputDecoration(
                    hintText: 'E.g 10:00 AM',
                    hintStyle: GoogleFonts.notoSans(),
                    labelText: 'New time for unit',
                    labelStyle: GoogleFonts.notoSans(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                style: GoogleFonts.notoSans(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter the time for the unit';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: reason,
                maxLines: 3,
                decoration: InputDecoration(
                    labelText: 'Reason',
                    labelStyle: GoogleFonts.notoSans(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                style: GoogleFonts.notoSans(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter reason for the request';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_requestDataKey.currentState!.validate()){
                    value.addRequest(
                        labName.text, unit.text, newTime.text, reason.text);
                    labName.clear();
                    unit.clear();
                    newTime.clear();
                    reason.clear();
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.secondaryContainer)),
                child: Text(
                  "Make request",
                  style: GoogleFonts.notoSans(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                )),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    unit.dispose();
    reason.dispose();
    labName.dispose();
    newTime.dispose();
  }
}
