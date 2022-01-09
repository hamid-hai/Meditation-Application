import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meditationapp/screens/main.dart' as app;
// import 'package:meditationapp/test/mock.dart';

void main() {

  // setupFirebaseAuthMocks();

  group('App Test', (){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('full app test', (tester) async{
      app.main();
      await tester.pumpAndSettle();

      final emailFormField = find.byType(TextFormField).first;
      final passwordFormField = find.byType(TextFormField).last;
      final signInButton = find.byType(TextButton).first;

      await tester.enterText(emailFormField, 'lisaRina@QVC.com');
      await tester.enterText(passwordFormField, 'HarryHamlit1968');
      await tester.pumpAndSettle();

      tester.tap(signInButton);
      await tester.pumpAndSettle();

    });
  });
}