import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class NHS extends StatelessWidget {
  const NHS({Key? key}) : super(key: key);

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
          SizedBox(height: 10,),
          ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text('Anyone!'),
          ),
          ListTile(
            title: Text('Nearest Locations'),
            subtitle: Text('Google Maps Widget'),
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
}
