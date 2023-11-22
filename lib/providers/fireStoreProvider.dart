import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
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
  void addRequest(String labName, String unit, String newTime, String reason) {
    requestsRef.add({
      'Lab Name': labName.trim(),
      'Unit': unit.trim(),
      'New Time': newTime.trim(),
      'Reason': reason.trim(),
      'Request Date':'22/11/2023',
      'Status': 'pending',
      'userId': 't6jERtoBZjRtOVF7dCJlzlCw9Xs2'
    });
    notifyListeners();
  }

// update a request
  void updateRequest() {}
//delete a request
  void deleteRequest() {}
}