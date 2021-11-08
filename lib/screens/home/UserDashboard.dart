import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          height: 80,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(10)),
          child: Center(
          child: Text(
              'Welcome to your wellness dashboard',
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          )
        ),
      ),
    );
  }
}