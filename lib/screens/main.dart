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
      // Reference https://pub.dev/packages/provider/changelog#500-nullsafety0
      initialData: null,
      // Catch errors are now required for StreamProvider
      // Reference https://stackoverflow.com/a/57478161
      catchError: (_, __) => null,
      value: AuthService().user,
      child: MaterialApp(
        // REFERENCE https://stackoverflow.com/a/62607827
        // Dark mode now follows system settings
        // Requires Android 10 (API level 29) or above to switch to dark mode
        theme: ThemeData(
          brightness: Brightness.light,
          /* light theme settings */
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
        ),
        themeMode: ThemeMode.system,
        home: Wrapper(),
      ),
    );
  }
}




