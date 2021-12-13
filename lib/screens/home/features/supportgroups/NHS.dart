import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng destMarker = LatLng(51.50721723582364, -3.1912815018219574);


class NHS extends StatefulWidget {
  @override
  State<NHS> createState() => _NHSState();
}

class _NHSState extends State<NHS> {

  // MARKER REFERENCE https://www.fluttercampus.com/guide/73/how-to-add-multiple-markers-on-google-map-flutter/
  Set<Marker> _markers = Set<Marker>();

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng showLocation = const LatLng(51.50721723582364, -3.1912815018219574);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("NHS"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(image: NetworkImage('https://www.mhcc.nhs.uk/wp-content/uploads/2020/04/NHS-blog-banner.png'))
            ],
          ),
          SizedBox(height: 5,),
          ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text('Anyone!'),
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
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    _controller = controller as Completer<GoogleMapController>;
                  });

                },
                initialCameraPosition: CameraPosition(target: showLocation,
                zoom: 14.4746)),
          ),



          ListTile(
            title: Text('How to contact'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    final url = 'tel:101';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                    },
                  icon: Icon(Icons.phone), label: Text('101 NHS')),
              ElevatedButton.icon(onPressed: () async {
                final url = 'https://www.nhs.uk/mental-health';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              }, icon: Icon(Icons.search), label: Text('NHS Website')),
              ElevatedButton.icon(onPressed:
                  () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                    title: const Text('Emergencys Only'),
                    content: const Text('Please only use this service if it is an genuine emergency'),
                    actions: <Widget>[
                    TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                    ),
                    TextButton(
                    onPressed: () async {
                      final url = 'tel:999';

                      if (await canLaunch(url)) {
                      await launch(url);
                      }
                    },
                    child: const Text('Call', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),),
                    ],
                    ),
                    ), icon: Icon(Icons.phone), label: Text('999 NHS'), style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),),
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
          title: 'University Hospital of Wales',
          snippet: 'NHS Cardiff'
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return _markers;
  }
}
