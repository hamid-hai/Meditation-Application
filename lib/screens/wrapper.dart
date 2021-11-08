import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/UserDashboard.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // return either login or dashboard
    return UserDashboard();
  }
}


