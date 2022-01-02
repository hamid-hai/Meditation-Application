import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng destMarker = LatLng(51.50721723582364, -3.1912815018219574);

class NHS extends StatefulWidget {
  const NHS({Key? key}) : super(key: key);

  @override
  State<NHS> createState() => _NHSState();
}

class _NHSState extends State<NHS> {
  // MARKER REFERENCE https://www.fluttercampus.com/guide/73/how-to-add-multiple-markers-on-google-map-flutter/
  final Set<Marker> _markers = <Marker>{};

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng showLocation =
      LatLng(51.50721723582364, -3.1912815018219574);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NHS"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: const <Widget>[
              Image(
                  image: NetworkImage(
                      'https://www.mhcc.nhs.uk/wp-content/uploads/2020/04/NHS-blog-banner.png'))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text(
                'NHS Services are free for anyone suffering with any mental health conditons within the UK.'
                ' Services such as therapists and quizes can help aid during stressful times.'),
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
                onMapCreated: (controller) {
                  //method called when map is created
                  setState(() {
                    _controller = controller as Completer<GoogleMapController>;
                  });
                },
                initialCameraPosition:
                    const CameraPosition(target: showLocation, zoom: 14.4746)),
          ),

          const ListTile(
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
                  icon: const Icon(Icons.phone),
                  label: const Text('101 NHS')),
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'https://www.nhs.uk/mental-health';

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('NHS Website')),
              ElevatedButton.icon(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Emergency Only'),
                    content: const Text(
                        'Please only use this service if it is an genuine emergency'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          const url = 'tel:999';

                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: const Text('Call',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      ),
                    ],
                  ),
                ),
                icon: const Icon(Icons.phone),
                label: const Text('999 NHS'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
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
            title: 'University Hospital of Wales',
            snippet: 'NHS Cardiff'),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return _markers;
  }
}
