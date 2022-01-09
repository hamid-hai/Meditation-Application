import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Sounds extends StatefulWidget {
  const Sounds({Key? key}) : super(key: key);

  @override
  _SoundsState createState() => _SoundsState();
}

class _SoundsState extends State<Sounds> {
  AudioPlayer audioPlayer = AudioPlayer();

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ambient Sounds"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                    'Tap to play an amibent sound\nTap again to pause\n(An internet connection is required)',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              primary: true,
              children: <Widget>[
                Card(
                  key: Key('Rain'),
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/SOUNDSCRATE-RainyDay.mp3');
                    },
                    onLongPress: () {
                      // REFERENCE https://stackoverflow.com/a/45948243
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A relaxing rain sound"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://cdn.iconscout.com/icon/free/png-256/cloud-rain-1895139-1605055.png',
                            height: 100),
                        const Text('Rain')
                      ],
                    ),
                  ),
                ),
                Card(
                  key: Key('Waves'),
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-loopable-waves-on-beach-windy-1.mp3');
                    },
                    onLongPress: () {
                      // REFERENCE https://stackoverflow.com/a/45948243
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A relaxing waves sound"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://icon-library.com/images/air-element-icon/air-element-icon-8.jpg',
                            height: 100),
                        const Text('Beach Waves')
                      ],
                    ),
                  ),
                ),
                Card(
                  key: Key('Subway'),
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-public-subway-interior-1.mp3');
                    },
                    onLongPress: () {
                      // REFERENCE https://stackoverflow.com/a/45948243
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A relaxing subway sound"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/BSicon_TRAIN2.svg/1024px-BSicon_TRAIN2.svg.png',
                            height: 100),
                        const Text('Subway')
                      ],
                    ),
                  ),
                ),
                Card(
                  key: Key('City'),
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-city-ambience-4.mp3');
                    },
                    onLongPress: () {
                      // REFERENCE https://stackoverflow.com/a/45948243
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A relaxing city sound"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://cdn-icons-png.flaticon.com/512/699/699421.png',
                            height: 100),
                        const Text('City')
                      ],
                    ),
                  ),
                ),
                Card(
                  key: Key('Fire'),
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-fire.mp3');
                    },
                    onLongPress: () {
                      // REFERENCE https://stackoverflow.com/a/45948243
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A relaxing fire sound"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'http://simpleicon.com/wp-content/uploads/fire-256x256.png',
                            height: 100),
                        const Text('Fire')
                      ],
                    ),
                  ),
                ),
                Card(
                  key: Key('Forest'),
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-forest-ambient.mp3');
                    },
                    onLongPress: () {
                      // REFERENCE https://stackoverflow.com/a/45948243
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A relaxing forest sound"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://www.pngfind.com/pngs/m/127-1272126_christmas-trees-comments-forest-icon-png-black-and.png',
                            height: 100),
                        const Text('Forest')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getAudio(String url) async {
    if (playing) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Ambient Sound paused")));

      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Ambient Sound playing")));

      var res = await audioPlayer.play(url, isLocal: false);

      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
  }
}
