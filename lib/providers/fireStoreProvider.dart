import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestoredata extends ChangeNotifier {
  // paths to both collections in firebase
  final usersRef = FirebaseFirestore.instance.collection('users');
  final requestsRef = FirebaseFirestore.instance.collection('requests');
  late List<QueryDocumentSnapshot>_requestList;
  
  void fetchRequests()async{
    await requestsRef.get().then((value){
      return value.docs;
    });
  }

  get getRequests =>_requestList;
//add a request
  void addRequest() {
    requestsRef.add({});
    notifyListeners();
  }

// update a request
  void updateRequest() {}
//delete a request
  void deleteRequest() {}
}
