import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Labtile extends StatelessWidget {
  const Labtile({super.key, required this.labName, required this.computers, required this.index});

  final String labName;
  final int index;
  final int computers;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: 'image $index',
                child: Image.asset(
                  'assets/images/tc-01.jpg',
                  //width: 200,
                ),
              )),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Lab Name: $labName',
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Capacity: $computers',
                  style: GoogleFonts.notoSans(fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
