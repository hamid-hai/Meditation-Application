import 'package:flutter/material.dart';
import 'package:meditationapp/services/auth.dart';

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
                      print('Amibent Sounds short press');
                    },
                    onLongPress: () {
                      print('Amibent Sounds long press');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                      print('Mood Logs short press');
                    },
                    onLongPress: () {
                      print('Mood Logs long press');
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
                      print('Extra Support short press');
                    },
                    onLongPress: () {
                      print('Extra Support long press');
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
                      print('Advert Removal short press');
                    },
                    onLongPress: () {
                      print('Advert Removal long press');
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