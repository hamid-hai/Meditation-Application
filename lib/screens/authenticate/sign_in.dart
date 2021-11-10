import 'package:flutter/material.dart';

import 'package:meditationapp/services/auth.dart';
import '../home/UserDashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("The Meditiation App"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/meditationlogo.jpg')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {

                  // No Firebase app when this code is entered into application
                  // ERROR FIXED, modifed 'main.dart' and dependency to pubspec.yaml
                  // Can be removed at a later stage as login with creds is recommenbed to provide custom info

                  dynamic result = await _auth.signInAnon();
                  if (result == null){
                    print('error singing in');
                  }
                  else {
                    print('signed in');
                    print('uid = ' + result.uid);
                  }

                },
                child: Text(
                  'Login Anon',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

            SizedBox(
              height: 130,
            ),
            Text(
              'New User? Create Account',
              style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}