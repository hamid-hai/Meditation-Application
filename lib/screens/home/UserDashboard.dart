import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/features/ambientsounds.dart';
import 'package:meditationapp/screens/home/features/moodslogs.dart';
import 'package:meditationapp/screens/home/features/supportpage.dart';
import 'package:meditationapp/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'features/removalads.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {

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
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
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
                        Image.asset('assets/images/userdashboard/audio-wavesPNG.png'),
                        Text('Ambient Sounds')
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
                        Image.asset('assets/images/userdashboard/moodPNG.png'),
                        Text('Mood Logs')
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
                        Image.asset('assets/images/userdashboard/supportPNG.png'),
                        Text('Extra Support')
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
                        Image.asset('assets/images/userdashboard/delete.PNG.png'),
                        Text('Advert Removal')
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