import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditationapp/screens/authenticate/register.dart';
import 'package:meditationapp/screens/shared/loading.dart';

import 'package:meditationapp/services/auth.dart';
import '../home/UserDashboard.dart';

// REFERENCE FOR NULL SAFETY ERROR
// https://stackoverflow.com/a/68322295
class EmailFieldValidatorSignIn {
  static String? validate(String? val) {
    return val!.isEmpty ? 'Please enter a valid email' : null;
  }
}

class PasswordFieldValidatorSignIn {
  static String? validate(String? val) {
    return val!.length < 6 ? 'Enter a strong password (6+ characters)' : null;
  }
}



class LoginScreen extends StatefulWidget {

  // final Function toggleView;
  // LoginScreen({ required this.toggleView });

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String regError = '';


  @override
  Widget build(BuildContext context) {
    return loading ? LoadingWidget() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("The Meditiation App"),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
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
              child: TextFormField(
                validator: EmailFieldValidatorSignIn.validate,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
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
              child: TextFormField(
                validator: PasswordFieldValidatorSignIn.validate,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                  },
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 15
              ),
            ),


            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  if(_formkey.currentState!.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInEmailPassword(email, password);
                    // dynamic result = await _auth.regEmailPassword(email, password);
                    if(result == null) {
                      setState(() {
                        regError = 'Please supply valid credentials';
                        loading = false;
                      });
                    }
                    print('valid');
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

            SizedBox(height: 12.0),
            Text(
              regError,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
            ),

            SizedBox(
              height: 130,
            ),

            // Changing from Text to TextButton allows actions to be performed on the text with a transparent window being added.
            // Reference https://stackoverflow.com/a/66580557
            TextButton(
              key: Key('registerTextButton'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                'New User? Create Account',
              // Try to set text thickness to normal
              style: TextStyle(fontSize: 20, color: Colors.black, fontStyle: FontStyle.normal),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}