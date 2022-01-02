import 'package:flutter/material.dart';
import 'package:meditationapp/screens/home/features/supportgroups/calm.dart';
import 'package:meditationapp/screens/home/features/supportgroups/nhs.dart';
import 'package:meditationapp/screens/home/features/supportgroups/papryus.dart';
import 'package:meditationapp/screens/home/features/supportgroups/parent_helpline.dart';
import 'package:meditationapp/screens/home/features/supportgroups/samaritans.dart';
import 'package:meditationapp/screens/home/features/supportgroups/shout.dart';
import 'package:meditationapp/screens/home/features/supportgroups/young_minds.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Extra Support"),
        backgroundColor: Colors.deepPurple,
      ),
      body: _myListView(context),
    );
  }

  Widget _myListView(BuildContext context) {
    //
    final titles = [
      'NHS',
      'Samaritans',
      'SHOUT',
      'CALM',
      'Papryus',
      'YoungMinds',
      'YoungMinds (Parents)'
    ];
    //

    // REFERENCE https://docs.flutter.dev/cookbook/lists/basic-list
    return ListView(children: <Widget>[
      Card(
        elevation: 2,
        child: ListTile(
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1326841032143671296/8TOi8q83_400x400.jpg')),
          title: Text(titles[0]),
          subtitle: const Text('For general advice from the NHS'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NHS()));
          },
        ),
      ),
      Card(
        elevation: 2,
        child: ListTile(
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.suffolkuserforum.co.uk/wp-content/uploads/2016/02/samaritans-logo.jpg')),
          title: Text(titles[1]),
          subtitle: const Text('Free 24 Hour 365 Days Hotline'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Samaritans()));
          },
        ),
      ),
      Card(
        elevation: 2,
        child: ListTile(
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.bbcchildreninneed.co.uk/wp-content/uploads/2019/10/Shout.jpg')),
          title: Text(titles[2]),
          subtitle: const Text('Free 24 Hour Confidential Text Support'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Shout()));
          },
        ),
      ),
      Card(
        elevation: 2,
        child: ListTile(
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1434869173126053892/WCWYM3R7_400x400.jpg')),
          title: Text(titles[3]),
          subtitle: const Text('Free For Men, 5PM-Midnight, 7 Days a week'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Calm()));
          },
        ),
      ),
      Card(
        elevation: 2,
        child: ListTile(
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.kirkleeslocaloffer.org.uk/Resources/FileStorage/Products/Events/f642bad8-cfd5-45ea-98b2-abdd00bf6974/4bacccd5-77a8-4414-a320-8800c116d9a5.jpg')),
          title: Text(titles[4]),
          subtitle: const Text('Free Under 35s, 9AM-Midnight, 7 Days a week'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Papryus()));
          },
        ),
      ),
      Card(
        elevation: 2,
        child: ListTile(
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.propertymark.co.uk/static/dc6ad9e2-3053-490f-b64137110d482b07/opengraphimage_83f4e8796336604b59d7216d0ecd81a5/Young-Minds-logo.jpg')),
          title: Text(titles[5]),
          subtitle: const Text('Young People Crisis Messaging Service 24/7'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const YoungMinds()));
          },
        ),
      ),
      Card(
        elevation: 2,
        child: ListTile(
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.propertymark.co.uk/static/dc6ad9e2-3053-490f-b64137110d482b07/opengraphimage_83f4e8796336604b59d7216d0ecd81a5/Young-Minds-logo.jpg')),
          title: Text(titles[6]),
          subtitle:
              const Text('Parent Crisis Phone and Live Chat Service 24/7'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ParentHelpline()));
          },
        ),
      ),
    ]);
  }
}
