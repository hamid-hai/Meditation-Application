import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/features/moodlogs/mood.dart';
import 'package:meditationapp/services/database.dart';
import 'package:provider/provider.dart';

import '../moodicon.dart';

class MoodsLogs extends StatefulWidget {
  const MoodsLogs({Key? key}) : super(key: key);

  @override
  _MoodsLogsState createState() => _MoodsLogsState();
}

class _MoodsLogsState extends State<MoodsLogs> {

  late String mood;
  late String image;
  late String datepicked;
  late String timepicked;
  late String datetime;
  late int currentindex;
  late String dateonly;
  int ontapcount = 0;

  List<Mood> moods = [
    Mood('assets/images/moodimages/sad.png', 'Sad', false),
    Mood('assets/images/moodimages/mediumsad.png', 'Medium\nSad', false),
    Mood('assets/images/moodimages/nuteral.png', 'Neutral', false),
    Mood('assets/images/moodimages/mediumhappy.png', 'Medium\nHappy', false),
    Mood('assets/images/moodimages/veryhappy.png', 'Very\nHappy', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Mood Logs"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(width: 70),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    icon: Icon(Icons.date_range),
                    label: Text('Pick a date'),
                    onPressed: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2022))
                        .then((date) => {
                      setState(() {
                        datepicked = date!.day.toString() +
                            '-' +
                            date.month.toString() +
                            '-' +
                            date.year.toString();
                        dateonly = date.day.toString() +
                            '/' +
                            date.month.toString();
                      }),
                    })),
                TextButton.icon(
                    icon: Icon(Icons.timer),
                    label: Text('Pick a Time'),
                    onPressed: () => showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                        .then((time) => {
                      setState(() {
                        timepicked = time!.format(context).toString();
                      })
                    })),
                Container(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    child: Icon(Icons.done),
                    onPressed: () => setState(() {
                      datetime = datepicked + '  ' + timepicked;
                      print(datetime.toString());
                    }),
                  ),
                ),
              ],
            ),
          ),

            SizedBox(height: 40),
            Text('How are you feeling?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('(Select a date from above)\n\n(Select a mood from below)', textAlign: TextAlign.center,),

            Expanded(

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moods.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: <Widget>[
                        Center(child: SizedBox(width: 20)),
                        GestureDetector(
                            child: MoodIcon(
                                image: moods[index].moodimage,
                                name: moods[index].name,
                                colour: moods[index].iselected
                                    ? Colors.black
                                    : Colors.white),
                            onTap: () => {
                              if (ontapcount == 0)
                                {
                                  setState(() {
                                    mood = moods[index].name;
                                    image = moods[index].moodimage;
                                    moods[index].iselected = true;
                                    ontapcount = ontapcount + 1;
                                    print(mood);
                                  }),
                                }
                              else if (moods[index].iselected)
                                {
                                  setState(() {
                                    moods[index].iselected = false;
                                    ontapcount = 0;
                                  })
                                }
                            }),
                      ],
                    );
                  }),
            ),
            TextButton.icon(
                icon: Icon(Icons.send), label: Text('Submit'),
              onPressed: () async => {
              setState(() {
                User? user = FirebaseAuth.instance.currentUser;

                FirebaseFirestore.instance.runTransaction((transaction) async {
                  await transaction.set(FirebaseFirestore.instance.collection(
                      'diaries').doc(user!.uid), {
                    'dateandtime': datetime,
                    'mood': mood
                  });
                });


              }),
            },
            )
          ]),

      ),


    );
  }
}
