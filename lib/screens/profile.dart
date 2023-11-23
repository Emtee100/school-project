import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<Firestoredata>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Icon(
            Icons.account_circle,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: value.usersRef.get().then((value) => value.docs),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      Text(snapshot.data![0]['Full Name'],
                          style: GoogleFonts.notoSans(fontSize: 25)),
                          Text(snapshot.data![0]['Role'],
                          style: GoogleFonts.notoSans()),
                          
                      Text(snapshot.data![0]['Email'],
                          style: GoogleFonts.notoSans())
                    ],
                  );
                } else {
                  return Text(
                    "Error loading data",
                    style: GoogleFonts.notoSans(),
                  );
                }
              }),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondaryContainer),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Requests',
                        style: GoogleFonts.notoSans(),
                      ),
                      FutureBuilder(
                          future: value.reqeustList,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Text(snapshot.data!.length.toString());
                            } else {
                              return Text(
                                "Error loading data",
                                style: GoogleFonts.notoSans(),
                              );
                            }
                          }),
                    ]),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text(
                "Sign out",
                style: GoogleFonts.notoSans(),
              ))
        ],
      ),
    ));
  }
}
