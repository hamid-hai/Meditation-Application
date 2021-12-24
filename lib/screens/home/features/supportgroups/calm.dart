import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng destMarker = LatLng(51.50721723582364, -3.1912815018219574);


class Calm extends StatelessWidget {
  Set<Marker> _markers = Set<Marker>();

  Completer<GoogleMapController> _controller = Completer();

  late LatLng destinationMarker;

  void setLocationMarkers() {
    destinationMarker = LatLng(
        destMarker.latitude,
        destMarker.longitude
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALM"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(image: NetworkImage('https://centaur-wp.s3.eu-central-1.amazonaws.com/designweek/prod/content/uploads/2021/09/14145316/CALM_Logo.jpg'))
            ],
          ),
          SizedBox(height: 5,),
          ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text('CALM is a service designed for Men'),
          ),
          ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('Phone and Web Chat\n\n- 5PM-Midnight\n\nYou can find out more infomation through the\nCALM Charity website.'),
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
                  icon: Icon(Icons.phone), label: Text('0800585858')),
              ElevatedButton.icon(onPressed: () async {
                final url = 'https://www.thecalmzone.net/';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              }, icon: Icon(Icons.search), label: Text('CALM\nwebsite', textAlign: TextAlign.center,)),
              ElevatedButton.icon(
                onPressed: () async {
                  final url = 'https://www.thecalmzone.net/help/webchat/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                }, icon: Icon(Icons.chat), label: Text('Web Chat'),),
            ],
          ),
        ],
      ),
    );
  }
}
