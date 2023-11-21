import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestoredata extends ChangeNotifier {
  // paths to both collections in firebase
  final usersRef = FirebaseFirestore.instance.collection('users');
  final requestsRef = FirebaseFirestore.instance.collection('requests');
  late final Future<List<Map<String, dynamic>>> reqeustList = getRequests();

  Future<List<Map<String, dynamic>>> getRequests() async {
    List<Map<String, dynamic>> requestDocuments = [];
    await requestsRef.get().then((value) {
      for (var element in value.docs) {
        requestDocuments.add(element.data());
      }
    });
    print(requestDocuments);
    return requestDocuments;
  }

  // get requestData => _reqeustList;he ol wa is upddhheiilkjhe ol wa ki suphe olwa he ol wa is uphe olwa is uphe olwa is up he ol wa i up

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