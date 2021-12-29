import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class youngMinds extends StatelessWidget {
  const youngMinds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Marker> _markers = Set<Marker>();

    Completer<GoogleMapController> _controller = Completer();

    return Scaffold(
      appBar: AppBar(
        title: Text("Young Minds"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(image: NetworkImage('https://i2.wp.com/www.boingboing.org.uk/wp-content/uploads/2016/10/YoungMinds-logo-990.jpg?fit=990%2C350&ssl=1'))
            ],
          ),
          ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text('Young Minds provides free 24/7 anonymous mental health text support for Young People across the UK\n\nTexts are free from all major networks'),
          ),
          ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('24/7, 365 days of the year'),
          ),



          ListTile(
            title: Text('How to contact'),
          ),
          // REFERENCE https://protocoderspoint.com/flutter-open-website-send-sms-email-make-call/#url_launcher_flutter_package
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    final url = 'sms:85258?body=YM';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: Icon(Icons.sms), label: Text('Young Minds\n85258', textAlign: TextAlign.center,)),
              ElevatedButton.icon(onPressed: () async {
                final url = 'https://www.youngminds.org.uk/';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              }, icon: Icon(Icons.search), label: Text('Young Minds\nWebsite', textAlign: TextAlign.center,)),
            ],
          ),
        ],
      ),
    );
  }
}
