import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meditationapp/screens/main.dart' as app;


void main() {

  // setupFirebaseAuthMocks();

  group('App Test', (){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Whole App Test', (tester) async{
      app.main();
      await tester.pumpAndSettle();

      final emailFormField = find.byKey(Key('emailField'));
      final passwordFormField = find.byKey(Key('passwordField'));
      final signInButton = find.byKey(Key('loginInButton'));

      await tester.enterText(emailFormField, 'lisaRina@QVC.com');
      await tester.enterText(passwordFormField, 'HarryHamlit1968');
      await tester.pumpAndSettle();

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      // Reached UserDashboard

      // await tester.pump(new Duration(seconds: 10));

      final AmbSounds = find.byKey(Key('Sounds'));
      final MoodBoard = find.byKey(Key('Mood'));
      final Support = find.byKey(Key('Support'));

      await tester.tap(AmbSounds);
      await tester.pumpAndSettle();

    // Ambient Sounds

      final Rain = find.byKey(Key('Rain'));
      await tester.tap(Rain);
      await tester.pump(new Duration(seconds: 5));
      await tester.tap(Rain);
      await tester.pump(new Duration(seconds: 5));
      final Waves = find.byKey(Key('Waves'));
      await tester.tap(Waves);
      await tester.pump(new Duration(seconds: 5));
      await tester.tap(Waves);
      await tester.pump(new Duration(seconds: 5));
      final Subway = find.byKey(Key('Subway'));
      await tester.tap(Subway);
      await tester.pump(new Duration(seconds: 5));
      await tester.tap(Subway);
      await tester.pump(new Duration(seconds: 5));
      final City = find.byKey(Key('City'));
      await tester.tap(City);
      await tester.pump(new Duration(seconds: 5));
      await tester.tap(City);
      await tester.pump(new Duration(seconds: 5));
      final Fire = find.byKey(Key('Fire'));
      await tester.tap(Fire);
      await tester.pump(new Duration(seconds: 5));
      await tester.tap(Fire);
      await tester.pump(new Duration(seconds: 5));
      final Forest = find.byKey(Key('Forest'));
      await tester.tap(Forest);
      await tester.pump(new Duration(seconds: 5));
      await tester.tap(Forest);
      await tester.pump(new Duration(seconds: 5));

      final backButton = find.byTooltip('Back');

      await tester.tap(backButton);
      await tester.pumpAndSettle();

      await tester.tap(Support);
      await tester.pumpAndSettle();

      // On Support Pages

      // final NHS = find.byKey(Key('NHS'));
      // await tester.tap(NHS);
      // await tester.pumpAndSettle(new Duration(seconds: 5));
      // await tester.tap(backButton);
      // final Samaritans = find.byKey(Key('Samaritans'));
      // await tester.tap(Samaritans);
      // await tester.pumpAndSettle(new Duration(seconds: 5));
      // await tester.tap(backButton);
      final Shout = find.byKey(Key('Shout'));
      await tester.tap(Shout);
      await tester.pumpAndSettle(new Duration(seconds: 5));
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      final Calm = find.byKey(Key('Calm'));
      await tester.tap(Calm);
      await tester.pumpAndSettle(new Duration(seconds: 5));
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      final Papryus = find.byKey(Key('Papryus'));
      await tester.tap(Papryus);
      await tester.pumpAndSettle(new Duration(seconds: 5));
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      final YoungMinds = find.byKey(Key('YoungMinds'));
      await tester.tap(YoungMinds);
      await tester.pumpAndSettle(new Duration(seconds: 5));
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      final ParentHelpline = find.byKey(Key('ParentHelpline'));
      await tester.tap(ParentHelpline);
      await tester.pumpAndSettle(new Duration(seconds: 5));
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      await tester.tap(backButton);
      await tester.pumpAndSettle();

    //  Userdashboard

      await tester.tap(MoodBoard);
      await tester.pumpAndSettle();

    //  https://github.com/flutter/flutter/issues/87440
    //  Not possible currently to interact with native Android and iOS UI
    //  Unable to test Date and Time correctly along with Android Intents


      final DatePicker = find.byKey(Key('DatePicker'));
      await tester.tap(DatePicker);
      await tester.pumpAndSettle();
      final OkButton = find.text('OK');
      await tester.tap(OkButton);
      await tester.pumpAndSettle();
      final TimePicker = find.byKey(Key('TimePicker'));
      await tester.tap(TimePicker);
      await tester.pumpAndSettle();
      await tester.tap(OkButton);
      await tester.pumpAndSettle();
      final TickButtonMood = find.byKey(Key('DateAndTimeTickButton'));
      await tester.tap(TickButtonMood);
      await tester.pumpAndSettle();

    //  Selecting Mood
      final VeryHappyMood = find.text('Neutral');
      await tester.tap(VeryHappyMood);
      await tester.pumpAndSettle();

    //  Submitting
      final SubmitButton = find.byKey(Key('SubmitButtonMood'));
      await tester.tap(SubmitButton);
      await tester.pumpAndSettle();

    //  Moving to Mood History
      final MoodHistory = find.byKey(Key('MoodHistoryButton'));
      await tester.tap(MoodHistory);
      await tester.pumpAndSettle(new Duration(seconds: 5));

    //  Back to UserDashboard
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      await tester.tap(backButton);
      await tester.pumpAndSettle();

    //  Sign Out
      final SignOutButton = find.byKey(Key('SignOutButton'));
      await tester.tap(SignOutButton);
      await tester.pumpAndSettle();


















    });
  });
}