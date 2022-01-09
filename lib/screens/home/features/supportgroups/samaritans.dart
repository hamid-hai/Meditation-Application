import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Samaritans extends StatefulWidget {
  const Samaritans({Key? key}) : super(key: key);

  @override
  State<Samaritans> createState() => _SamaritansState();
}

class _SamaritansState extends State<Samaritans> {
  // MARKER REFERENCE https://www.fluttercampus.com/guide/73/how-to-add-multiple-markers-on-google-map-flutter/

  Set<Marker> _markers = new Set();

  static const LatLng showLocation =
      LatLng(51.48250384258919, -3.235368650542704);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Samaritans"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: const <Widget>[
              Image(
                  image: NetworkImage(
                      'https://www.limerick.ie/sites/default/files/styles/hero_image/public/media/images/2020-03/samaritans-810x456.png?itok=6OutECCT'))
            ],
          ),
          const ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text(
                'Samaritans is a free, confidential, anonymous service for anyone struggling with anything in the UK\n\nCalls are free and do not show on phone records'),
          ),
          const ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('24/7, 365 days of the year'),
          ),

          const ListTile(
            title: Text('Nearest Location'),
          ),

          // GOOGLE MAPS FUNCTION
          SizedBox(
            height: 125,
            child: GoogleMap(
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition:
                  const CameraPosition(target: showLocation, zoom: 15),
              markers: getmarkers(),
              onMapCreated: (controller) {
                //method called when map is created
                setState(() {});
              },
            ),
          ),

          const ListTile(
            title: Text('How to contact'),
          ),
          // REFERENCE https://protocoderspoint.com/flutter-open-website-send-sms-email-make-call/#url_launcher_flutter_package
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'tel:116123';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text(
                    'Samaritans\n116 123',
                    textAlign: TextAlign.center,
                  )),
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'https://www.samaritans.org/';

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.search),
                  label: const Text(
                    'Samaritans\nWebsite',
                    textAlign: TextAlign.center,
                  )),
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'mailto:jo@samaritans.org';

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.mail),
                  label: const Text(
                    'Email',
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Set<Marker> getmarkers() {
    setState(() {
      _markers.add(Marker(
        //add marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Samartians Cardiff',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return _markers;
  }
}
