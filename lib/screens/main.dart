import 'package:flutter/material.dart';
import 'package:meditationapp/models/myuser.dart';
import 'package:meditationapp/screens/wrapper.dart';
import 'package:meditationapp/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:meditationapp/models/myuser.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      // Following versions 5.0 and above, initialData: null is required
      // https://pub.dev/packages/provider/changelog#500-nullsafety0
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}




