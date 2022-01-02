import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Shout extends StatelessWidget {
  const Shout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SHOUT"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: const <Widget>[
              Image(
                  image: NetworkImage(
                      'https://parentzone.org.uk/sites/default/files/styles/square_crop_400x400/public/ShoutLogo2%203_5_19.png?itok=VzVJHe8O'))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            title: Text('Who is this service for?'),
            subtitle: Text(
                'Shout is a free, confidential, anonymous texting service for anyone struggling with their mental health in the UK'),
          ),
          const ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('24/7, 365 days of the year'),
          ),
          const ListTile(
            title: Text('How to contact'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'sms:85258?body=SHOUT';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.sms),
                  label: const Text('SHOUT 85258')),
              ElevatedButton.icon(
                  onPressed: () async {
                    const url = 'https://giveusashout.org/';

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  icon: const Icon(Icons.search),
                  label: const Text(
                    'SHOUT Website',
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
