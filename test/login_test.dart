//
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:meditationapp/models/myuser.dart';
// import 'package:meditationapp/screens/authenticate/sign_in.dart';
// import 'package:meditationapp/screens/home/user_dashboard.dart';
// import 'package:meditationapp/services/auth.dart';
// import 'package:mockito/mockito.dart';
//
// import 'mock.dart';
//
// class MockAuth extends Mock implements AuthService {}
//
// void main() {
//
//   setupFirebaseAuthMocks();
//
//   setUpAll(() async {
//     await Firebase.initializeApp();
//   });
//
//
//   Widget makeTestableWidget({required Widget child}) {
//     return MaterialApp(
//         // Maybe add extra code to return Auth
//         home: child,
//     );
//   }
//
//   testWidgets('email/password is empty', (WidgetTester tester) async {
//
//     bool didSignIn = false;
//
//     MockAuth mockAuth = MockAuth();
//
//     LoginScreen screen = LoginScreen();
//
//     await tester.pumpWidget(makeTestableWidget(child: screen));
//
//     Finder emailField = find.byKey(Key('emailField'));
//     await tester.enterText(emailField, 'lisaRina@QVC.com');
//
//     Finder passwordField = find.byKey(Key('passwordField'));
//     await tester.enterText(passwordField, 'HarryHamlit1968');
//
//     await tester.tap(find.byKey(Key('loginInButton')));
//
//     verify(mockAuth.signInEmailPassword('email', 'password')).called(1);
//
//     didSignIn = true;
//     expect(didSignIn, true);
//   });
//
//
//
// }