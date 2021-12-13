import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class Samartians extends StatelessWidget {
  const Samartians({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Marker> _markers = Set<Marker>();

    Completer<GoogleMapController> _controller = Completer();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Samartians"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(image: NetworkImage('https://www.limerick.ie/sites/default/files/styles/hero_image/public/media/images/2020-03/samaritans-810x456.png?itok=6OutECCT'))
            ],
          ),
          ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text('Samartians is a free, confidential, anonymous service for anyone struggling with anything in the UK\n\nCalls are free and do not show on phone records'),
          ),
          ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('24/7, 365 days of the year'),
          ),

          ListTile(
            title: Text('Nearest Location'),
          ),

          // GOOGLE MAPS FUNCTION
          Container(
            height: 125,
            child: GoogleMap(
                zoomControlsEnabled: false,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);

                },
                initialCameraPosition: CameraPosition(target: LatLng(51.48250384258919, -3.235368650542704),
                    zoom: 17)),
            // https://www.papyrus-uk.org/get-in-touch/
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
                    final url = 'tel:116123';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: Icon(Icons.phone), label: Text('Samaritans\n116 123', textAlign: TextAlign.center,)),
              ElevatedButton.icon(onPressed: () async {
                final url = 'https://www.samaritans.org/';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              }, icon: Icon(Icons.search), label: Text('Samaritans\nWebsite', textAlign: TextAlign.center,)),
              ElevatedButton.icon(onPressed: () async {
                final url = 'mailto:jo@samaritans.org';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              }, icon: Icon(Icons.mail), label: Text('Email', textAlign: TextAlign.center,)),
            ],
          ),
        ],
      ),
    );
  }
}
