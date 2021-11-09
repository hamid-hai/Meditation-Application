import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/UserDashboard.dart';
import 'package:meditationapp/screens/authenticate/authenticate.dart';

// import 'package:meditationapp/screens/authenticate/sign_in.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // return either login or dashboard
    return Authenticate();
  }
}


