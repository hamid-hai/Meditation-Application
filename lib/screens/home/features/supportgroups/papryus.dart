import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Papryus extends StatefulWidget {
  const Papryus({Key? key}) : super(key: key);

  @override
  State<Papryus> createState() => _PapryusState();
}

class _PapryusState extends State<Papryus> {
  // MARKER REFERENCE https://www.fluttercampus.com/guide/73/how-to-add-multiple-markers-on-google-map-flutter/

  final Set<Marker> _markers = <Marker>{};

  static const LatLng showLocation =
      LatLng(51.48281266917645, -3.168127140443014);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Papyrus"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: const <Widget>[
              Image(
                  image: NetworkImage(
                      'https://www.papyrus-uk.org/wp-content/uploads/2018/08/PAPYRUS-logo.png'))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text(
                'Papyrus is a charity for the prevention of young suicide (under 35) in the UK.'),
          ),
          const ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('Every Day 9:00 am to 12:00 am (midnight)'),
          ),

          const ListTile(
            title: Text('Nearest Location'),
          ),

          // GOOGLE MAPS FUNCTION
          SizedBox(
            height: 210,
            child: GoogleMap(
                zoomControlsEnabled: false,
                markers: getmarkers(),
                zoomGesturesEnabled: true,
                initialCameraPosition:
                    const CameraPosition(target: showLocation, zoom: 15),
                onMapCreated: (controller) {
                  //method called when map is created
                  setState(() {});
                }),

            // https://www.papyrus-uk.org/get-in-touch/
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
                    const url = 'tel:08000684141';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text(
                    'Papyrus\n0800 068 4141',
                    textAlign: TextAlign.center,
                  )),
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'https://www.papyrus-uk.org/';

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.search),
                  label: const Text(
                    'Papyrus\nWebsite',
                    textAlign: TextAlign.center,
                  )),
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'mailto:pat@papyrus-uk.org';

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
        infoWindow: const InfoWindow(
          //popup info
          title: 'Papyrus Cardiff',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return _markers;
  }
}
