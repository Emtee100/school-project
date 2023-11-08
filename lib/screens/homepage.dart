import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance.collection('users');
  final List<Map<String, dynamic>> userData = [];
  getData() {
    return db.get().then((value) {
      for (var document in value.docs) {
        userData.add(document.data());
      }
      print(userData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              height: 600,
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                 if(snapshot.connectionState == ConnectionState.done){
                    return ListView.builder(
                      itemCount: userData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(userData[index]['Full Name']),
                          subtitle: Text(userData[index]['Email']),
                        );
                      },
                    );}
                    else if(snapshot.connectionState == ConnectionState.active){
                      return Container(height: 50,child: const CircularProgressIndicator());
                    }
                    else if(snapshot.connectionState == ConnectionState.waiting){
                      return  Container(height: 50,child: const CircularProgressIndicator());
                    }
                    else {return const Text('loading');}
                  }         
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getData(),
        child: const Icon(Icons.logout_rounded),
      ),
    );
  }
}
