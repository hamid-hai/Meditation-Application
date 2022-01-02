import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ParentHelpline extends StatelessWidget {
  const ParentHelpline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parent Helpline (Young Minds)"),
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
                'Young Minds (Parent) provides free 24/7 anonymous mental health phone and live chat support for Parents across the UK\n\nTexts are free from all major networks'),
          ),
          const ListTile(
            title: Text('Opening Hours'),
            subtitle: Text('Monday - Friday 9:30AM-4:30PM'),
          ),

          const ListTile(
            title: Text('How to contact'),
          ),
          // REFERENCE https://protocoderspoint.com/flutter-open-website-send-sms-email-make-call/#url_launcher_flutter_package
          ElevatedButton.icon(
              onPressed: () async {
                const url = 'tel:08088025544';
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              icon: const Icon(Icons.phone),
              label: const Text(
                'Young Minds (Parents)\n08088025544',
                textAlign: TextAlign.center,
              )),
          ElevatedButton.icon(
              onPressed: () async {
                const url = 'https://www.youngminds.org.uk/parent/';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              icon: const Icon(Icons.search),
              label: const Text(
                'Young Minds(Parents)\nWebsite / Web Chat',
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
