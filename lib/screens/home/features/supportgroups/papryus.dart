import 'dart:async';

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

  Set<Marker> _markers = Set<Marker>();

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng showLocation = const LatLng(51.48281266917645, -3.168127140443014);
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Papyrus"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(image: NetworkImage('https://www.papyrus-uk.org/wp-content/uploads/2018/08/PAPYRUS-logo.png'))
            ],
          ),
          SizedBox(height: 5,),
          ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text('Papyrus is a charity for the prevention of young suicide (under 35) in the UK.'),
          ),
          ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('Every Day 9:00 am to 12:00 am (midnight)'),
          ),

          ListTile(
            title: Text('Nearest Location'),
          ),

          // GOOGLE MAPS FUNCTION
          Container(
            height: 210,
            child: GoogleMap(
                zoomControlsEnabled: false,
                markers: this.getmarkers(),
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(target: showLocation, zoom: 15),
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    _controller = controller as Completer<GoogleMapController>;
                  });
                }
            ),

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
                    final url = 'tel:08000684141';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: Icon(Icons.phone), label: Text('Papyrus\n0800 068 4141', textAlign: TextAlign.center,)),
              ElevatedButton.icon(onPressed: () async {
                final url = 'https://www.papyrus-uk.org/';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              }, icon: Icon(Icons.search), label: Text('Papyrus\nWebsite', textAlign: TextAlign.center,)),
              ElevatedButton.icon(onPressed: () async {
                final url = 'mailto:pat@papyrus-uk.org';

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
  Set<Marker> getmarkers() {
    setState(() {
      _markers.add(Marker( //add marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Papyrus Cardiff',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return _markers;
  }
}
