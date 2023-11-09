import 'package:flutter/material.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:provider/provider.dart';

class LabScreen extends StatelessWidget {
  const LabScreen({super.key});

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
                itemCount: value.getRequestList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.getRequestList[index]['Lab Name']),
                    subtitle: Text(value.getRequestList[index]['Unit']),
                  );
                },
              ))
        ],
      ),
    ));
  }
}
