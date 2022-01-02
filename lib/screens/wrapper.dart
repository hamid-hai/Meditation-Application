import 'package:flutter/material.dart';
import 'package:meditationapp/models/myuser.dart';
import 'package:meditationapp/screens/home/user_dashboard.dart';
import 'package:meditationapp/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

// import 'package:meditationapp/screens/authenticate/sign_in.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Flutter is now null safe, always put '?' or '!' around 'MyUser'
    
    final user = Provider.of<MyUser?>(context);

    // return either login or dashboard
    if (user == null) {
      return Authenticate();
    } else {
      return UserDashboard();
    }
  }
}


