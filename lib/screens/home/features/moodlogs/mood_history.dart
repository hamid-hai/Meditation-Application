import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodHistory extends StatefulWidget {
  const MoodHistory({Key? key}) : super(key: key);

  @override
  _MoodHistoryState createState() => _MoodHistoryState();
}

class _MoodHistoryState extends State<MoodHistory> {
  // Creating a new instance of the logged in user
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // Creating a new stream query selecting the correct collection, then peforming a query (filtering) finding where the UID matches and only displaying that data.
    // By using 'includeMetadataChanges' we can have realtime updates so the listview is always up to date.
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('diaries')
        .where('uid', isEqualTo: user!.uid)
        .orderBy('dateandtime', descending: true)
        .snapshots(includeMetadataChanges: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood History"),
        backgroundColor: Colors.deepPurple,
      ),

      // REFERENCE https://firebase.flutter.dev/docs/firestore/usage/#one-time-read

      // Using a streambuilder we can grab data in realtime and store it within a 'Stream' a type of list, we can then display this with a 'ListView'
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // If the snapshot has an error, display a text message to the user
          if (snapshot.hasError) {
            return const Center(
                child: Text(
                    'Something went wrong\n\nPlease check your internet connection',
                    textAlign: TextAlign.center));
          }

          // While data is loading depending on differnet factors return a circular progress indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // If neither of the conditions are true return a ListView populated with the snapshot data collected and stored in the Stream
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              // Using 'Card' allows a neater cleaner material UI lsit view of the data.
              return Card(
                elevation: 2,
                child: ListTile(
                  title: Text(data['mood']),
                  subtitle: Text(data['dateandtime']),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
