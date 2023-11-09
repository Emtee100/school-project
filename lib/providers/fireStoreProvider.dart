import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestoredata extends ChangeNotifier {
  // paths to both collections in firebase
  final usersRef = FirebaseFirestore.instance.collection('users');
  final requestsRef = FirebaseFirestore.instance.collection('requests');

  //list of requests even though it is empty
  final List<QueryDocumentSnapshot> _list = [];

//method for adding the requests into the empty list of requests
  Future<void> getRequests() async {
    await requestsRef.get().then((value) {
      for (var doc in value.docs) {
        _list.add(doc);
      }
    });
  }


  // return the requests but first add them into the empty list. 
  //It returns a future of type list cause getRequests is async in nature.
  get getRequestList {
    getRequests();
    return _list;
  }

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
