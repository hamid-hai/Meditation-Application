import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/features/ambientsounds.dart';
import 'package:meditationapp/screens/home/features/moodslogs.dart';
import 'package:meditationapp/screens/home/features/supportpage.dart';
import 'package:meditationapp/services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'features/removalads.dart';

Future<Quote> fetchQuote() async {
  final response = await http.get(Uri.parse('http://quotes.rest/qod.json?category=inspire'));

  if (response.statusCode == 200) {

    return Quote.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to load Quote of the Day');
  }
}

class Quote {
  final String quote;
  final String author;

  Quote({
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quote: json['quote'],
      author: json['author']
    );
  }
}

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  late Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = fetchQuote();
  }

  String url = 'http://quotes.rest/qod.json?category=inspire';

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {

    var cardStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          // Text Button used as a replacement for FlatButton
          // Reference https://stackoverflow.com/a/51266672
          TextButton.icon(onPressed: () async {
            await _auth.signOut();
          },
              icon: Icon(Icons.person),
              label: Text('Sign out'))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 50,
           child: Center(
            child: Text(
            'Welcome "User"',
            style: TextStyle(color: Colors.black, fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),

            Container(
              alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 75),
                child: FutureBuilder<Quote>(
                  future: futureQuote,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('${snapshot.data!.quote}');
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const CircularProgressIndicator();
                  }
                ),
            ),

          Padding(
            padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              primary: false,
              children: <Widget>[
                Card(
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: new InkWell(
                    onTap: () {
                      Navigator.push((context), MaterialPageRoute(builder: (context) => Sounds()));
                    },
                    onLongPress: () {
                      // REFERENCE https://stackoverflow.com/a/45948243
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Ambient Sounds"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // TODO Find why images wont be displayed in userdashboard directory
                        Image.asset('assets/images/userdashboard/audiowaves.png', height: 100),
                        Text('Ambient Sounds', style: cardStyle)
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 4,
                  child: new InkWell(
                    onTap: () {
                      Navigator.push((context), MaterialPageRoute(builder: (context) => MoodsLogs()));
                    },
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Mood Logs"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/userdashboard/mood.png', height: 100),
                        Text('Mood Logs', style: cardStyle)
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 4,
                  child: new InkWell(
                    onTap: () {
                      Navigator.push((context), MaterialPageRoute(builder: (context) => SupportPage()));
                    },
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Extra Support"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/userdashboard/support.png', height: 100),
                        Text('Extra Support', style: cardStyle)
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 4,
                  child: new InkWell(
                    onTap: () {
                      Navigator.push((context), MaterialPageRoute(builder: (context) => AdvertRemoval()));
                    },
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Advert Removal"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/userdashboard/delete.png', height: 100),
                        Text('Advert Removal', style: cardStyle)
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
    ],
    )
    );


  }
}