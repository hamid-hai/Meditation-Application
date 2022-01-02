import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoungMinds extends StatelessWidget {
  const YoungMinds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Young Minds"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: const <Widget>[
              Image(
                  image: NetworkImage(
                      'https://i2.wp.com/www.boingboing.org.uk/wp-content/uploads/2016/10/YoungMinds-logo-990.jpg?fit=990%2C350&ssl=1'))
            ],
          ),
          const ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text(
                'Young Minds provides free 24/7 anonymous mental health text support for Young People across the UK\n\nTexts are free from all major networks'),
          ),
          const ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('24/7, 365 days of the year'),
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
                    const url = 'sms:85258?body=YM';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.sms),
                  label: const Text(
                    'Young Minds\n85258',
                    textAlign: TextAlign.center,
                  )),
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'https://www.youngminds.org.uk/';

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.search),
                  label: const Text(
                    'Young Minds\nWebsite',
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
