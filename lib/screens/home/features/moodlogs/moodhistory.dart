import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class moodHistory extends StatefulWidget {
  const moodHistory({Key? key}) : super(key: key);

  @override
  _moodHistoryState createState() => _moodHistoryState();
}

class _moodHistoryState extends State<moodHistory> {

  User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('diaries').where('uid', isEqualTo: user!.uid).snapshots(includeMetadataChanges: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Mood History"),
        backgroundColor: Colors.deepPurple,
      ),


      body: StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong\n\nPlease check your internet connection', textAlign: TextAlign.center));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }




        return
          ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Card(
              elevation: 2,
              child: ListTile(
              title: Text(data['mood']),
              subtitle: Text(data['dateandtime']),
            ),);
          }).toList(),
        );
      },
    ),
    );
  }

}
