import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/user_dashboard.dart';
import 'package:meditationapp/services/auth.dart';

class EmailFieldValidatorRegister {
  static String? validate(String? val) {
    return val!.isEmpty ? 'Please enter a valid email' : null;
  }
}

class PasswordFieldValidatorRegister {
  static String? validate(String? val) {
    return val!.length < 6 ? 'Enter a strong password (6+ characters)' : null;
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);


  // final Function toggleView;
  // Register({ required this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String regError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: Form(
          key: _formkey,
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
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: TextFormField(
                  validator: EmailFieldValidatorRegister.validate,
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
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: TextFormField(
                  validator: PasswordFieldValidatorRegister.validate,
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
              SizedBox(height: 20.0),
              ElevatedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      dynamic result = await _auth.regEmailPassword(email, password);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserDashboard())
                      );
                      if(result == null) {
                        setState(() {
                          regError = 'Please supply valid credentials';
                        });
                      }
                    }
                  }
              ),
              SizedBox(height: 12.0),
              Text(
                regError,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
