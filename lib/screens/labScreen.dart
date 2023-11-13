import 'package:flutter/material.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:provider/provider.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<Firestoredata>(
      builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 600,
              child: ListView.builder(
                itemCount: value.getRequests.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.getRequests[index]['Lab Name']),
                    subtitle: Text(value.getRequests[index]["Unit"]),
                  );
                },
              ))
        ],
      ),
    ));
  }
}
