import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/features/ambient_sounds.dart';
import 'package:meditationapp/screens/home/features/mood_logs.dart';
import 'package:meditationapp/screens/home/features/support_page.dart';
import 'package:meditationapp/services/auth.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
// REFERENCE
//https://pub.dev/packages/dio
//https://stackoverflow.com/a/63975576
//https://stackoverflow.com/a/53837179

  late Future<String> finalQuote;
  late Future<String> finalAuthor;

  Future<String> getQuoteDio() async {
    Response response =
        await Dio().get("http://quotes.rest/qod.json?category=inspire");
    Map result = response.data;
    Map firstFilter = result['contents']['quotes'][0];
    String quoteRead = firstFilter["quote"].toString();
    return quoteRead;
  }

  Future<String> getAuthorDio() async {
    Response response =
        await Dio().get("http://quotes.rest/qod.json?category=inspire");
    Map result = response.data;
    Map firstFilter = result['contents']['quotes'][0];
    String authorRead = firstFilter["author"].toString();
    return authorRead;
  }

  @override
  void initState() {
    finalQuote = getQuoteDio();
    finalAuthor = getAuthorDio();
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var cardStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            // Text Button used as a replacement for FlatButton
            // Reference https://stackoverflow.com/a/51266672
            TextButton.icon(
              key: Key('SignOutButton'),
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: const Icon(Icons.person),
                label: const Text('Sign out'))
          ],
        ),
        body: Stack(
          children: <Widget>[
            const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Welcome to your dashboard!',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 125,
              child: Center(
                child: Text(
                  'Quote of the day',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 85),
                // child: Text(finalQuote.toString()),
                child: FutureBuilder<String>(
                  future: finalQuote,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // REFERENCE
                      // https://stackoverflow.com/a/68429051
                      return Text(snapshot.data ?? 'Cannot load quote',
                          textAlign: TextAlign.center);
                    }
                    if (snapshot.hasError) {
                      return const Text(
                          'Something went wrong\n\nPlease check your internet connection',
                          textAlign: TextAlign.center);
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Text(
                          'Unknown Error, please check your internet connection');
                    }
                  },
                )),
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 160),
                // child: Text(finalQuote.toString()),
                child: FutureBuilder<String>(
                  future: finalAuthor,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // REFERENCE
                      // https://stackoverflow.com/a/68429051
                      return Text(snapshot.data ?? 'Cannot load author',
                          textAlign: TextAlign.center);
                    }
                    if (snapshot.hasError) {
                      return const Text(
                          '',
                          textAlign: TextAlign.center);
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Text(
                          '');
                    }
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 10, right: 10),
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                primary: false,
                children: <Widget>[
                  Card(
                    key: Key('Sounds'),
                    elevation: 4,
                    // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => const Sounds()));
                      },
                      onLongPress: () {
                        // REFERENCE https://stackoverflow.com/a/45948243
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Sounds"),
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                              'assets/images/userdashboard/audiowaves.png',
                              height: 100),
                          Text('Ambient Sounds', style: cardStyle)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    key: Key('Mood'),
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => const MoodsLogs()));
                      },
                      onLongPress: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Mood Logs"),
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/userdashboard/mood.png',
                              height: 100),
                          Text('Mood Logs', style: cardStyle)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    key: Key('Support'),
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => const SupportPage()));
                      },
                      onLongPress: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Extra Support"),
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/userdashboard/support.png',
                              height: 100),
                          Text('Extra Support', style: cardStyle)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
