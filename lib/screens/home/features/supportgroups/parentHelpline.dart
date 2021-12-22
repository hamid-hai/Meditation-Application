import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class parentHelpline extends StatelessWidget {
  const parentHelpline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Marker> _markers = Set<Marker>();

    Completer<GoogleMapController> _controller = Completer();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Parent Helpline (Young Minds)"),
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
            subtitle: Text('Young Minds (Parent) provides free 24/7 anonymous mental health phone and live chat support for Parents across the UK\n\nTexts are free from all major networks'),
          ),
          ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('Monday - Friday 9:30AM-4:30PM'),
          ),



          ListTile(
            title: Text('How to contact'),
          ),
          // REFERENCE https://protocoderspoint.com/flutter-open-website-send-sms-email-make-call/#url_launcher_flutter_package
              ElevatedButton.icon(
                  onPressed: () async {
                    final url = 'tel:08088025544';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: Icon(Icons.phone), label: Text('Young Minds (Parents)\n08088025544', textAlign: TextAlign.center,)),
              ElevatedButton.icon(onPressed: () async {
                final url = 'https://www.youngminds.org.uk/parent/';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              }, icon: Icon(Icons.search), label: Text('Young Minds(Parents)\nWebsite / Web Chat', textAlign: TextAlign.center,)),


        ],
      ),
    );
  }
}
