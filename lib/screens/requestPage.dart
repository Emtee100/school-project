import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:provider/provider.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Lab Requests",
            style:
                GoogleFonts.notoSans(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          //const SizedBox(height: 20,),
          Expanded(
            child: Consumer<Firestoredata>(
              builder: (context, value, child) => Column(
                children: [
                  Expanded(
                      child: FutureBuilder(
                    future: value.reqeustList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data!.isNotEmpty) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/tc-01.jpg',
                                        width: 170,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index]['Unit'],
                                            style: GoogleFonts.notoSans(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            snapshot.data![index]['Lab Name'],
                                            style: GoogleFonts.notoSans(),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Date of request: ' +
                                                snapshot.data![index]
                                                    ['Request Date'],
                                            style: GoogleFonts.notoSans(),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Center(
                                child: Text(
                                  'You have not made any requests yet',
                                  style: GoogleFonts.notoSans(),
                                ),
                              );
                            }
                          },
                        );
                      } else {
                        return const Text("Error Loading data");
                      }
                    },
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
