import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userData =
      FirebaseFirestore.instance.collection('userData');

  final CollectionReference moodLogs =
      FirebaseFirestore.instance.collection('moodLogs');

  Future updateUserData(String name) async {
    return await userData.doc(uid).set({'names': name});
  }
}
