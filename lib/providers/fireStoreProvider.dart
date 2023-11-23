import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firestoredata extends ChangeNotifier {
  // paths to both collections in firebase
  final usersRef = FirebaseFirestore.instance.collection('users');
  final applicationsRef = FirebaseFirestore.instance.collection('applications');
  late final Future<List<Map<String, dynamic>>> reqeustList = getRequests();
  final String _userId = FirebaseAuth.instance.currentUser!.uid;

//methods that allows a user to get and set the variable _userId 
// to their own uid. This will allow the user to pass the cloud firestore
// security rules of accessing only their data

// set setId(){
//   _userId = FirebaseAuth.instance.currentUser!.uid;
// }

// method that gets all documents in the request collection
// the get() method retrieves the Querysnapshot then we add 
// the document's data to requestDocuments list as a map of string and dynamic 
  Future<List<Map<String, dynamic>>> getRequests() async {
    List<Map<String, dynamic>> requestDocuments = [];
    await applicationsRef.get().then((value) {
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
    applicationsRef.add({
      'Lab Name': labName.trim(),
      'Unit': unit.trim(),
      'New Time': newTime.trim(),
      'Reason': reason.trim(),
      'Request Date':FieldValue.serverTimestamp(),
      'Status': 'pending',
      'uid': _userId,
    });
    notifyListeners();
  }

// update a request
  void updateRequest() {}
//delete a request
  void deleteRequest() {}
}