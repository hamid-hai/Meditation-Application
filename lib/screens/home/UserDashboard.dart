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
      body: SingleChildScrollView(
        child: Center(
        child: Container(

          height: 50,
          width: 250,

          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(10)),
          child: Center(
          child: Text(
              'Welcome "User"',
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          )
        ),
      ),
      ),
      );
  }
}