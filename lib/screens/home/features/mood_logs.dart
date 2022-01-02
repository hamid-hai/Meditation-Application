import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/features/moodlogs/mood.dart';
import 'package:meditationapp/screens/home/features/moodlogs/mood_history.dart';

import 'moodlogs/mood_icon.dart';

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
  late DateTime datesorter;

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
      appBar: AppBar(
        title: const Text("Mood Logs"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(children: <Widget>[
        const SizedBox(width: 70),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
              'Select a date and time\nPress the tick button to confirm',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  icon: const Icon(Icons.date_range),
                  label: const Text('Pick a date'),
                  onPressed: () => showDatePicker(

                          // Calculating the date the user has pressed
                          // Converting to a string format for the 'Mood Logs History'
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2022))
                      .then((date) => {
                            setState(() {
                              datesorter = date!;
                              datepicked = date.day.toString() +
                                  '-' +
                                  date.month.toString() +
                                  '-' +
                                  date.year.toString();
                              dateonly = date.day.toString() +
                                  '/' +
                                  date.month.toString();
                            }),
                          })),

              // Repeating the process for the Time
              TextButton.icon(
                  icon: const Icon(Icons.timer),
                  label: const Text('Pick a Time'),
                  onPressed: () => showTimePicker(
                          context: context, initialTime: TimeOfDay.now())
                      .then((time) => {
                            setState(() {
                              timepicked = time!.format(context).toString();
                            })
                          })),

              // By pressing confirm we combine the date and time into one string
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  child: const Icon(Icons.done),
                  onPressed: () => setState(() {
                    datetime = datepicked + '  ' + timepicked;
                  }),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 50),
        const Text('How are you feeling?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        const Text(
          '(Select a mood from below)\n\n(Tap to select, tap again to deselect)',
          textAlign: TextAlign.center,
        ),

        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moods.length,
              itemBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    const Center(child: SizedBox(width: 20)),
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

        // Async function that contacts firebase and stores the data collected on this screen.
        TextButton.icon(
          icon: const Icon(Icons.send),
          label: const Text('Submit'),
          onPressed: () async {
            User? user = FirebaseAuth.instance.currentUser;

            await FirebaseFirestore.instance.collection('diaries').add({
              'uid': user!.uid,
              'dateandtime': datetime,
              'date': datesorter,
              'mood': mood
            });
          },
        ),

        // Pushes to next screen, Mood Logs History
        TextButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MoodHistory()));
            },
            icon: const Icon(Icons.table_rows_rounded),
            label: const Text('Go to Mood Logs History')),
      ]),
    );
  }
}
