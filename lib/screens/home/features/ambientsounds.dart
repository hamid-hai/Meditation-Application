import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';



class Sounds extends StatefulWidget {
  const Sounds({Key? key}) : super(key: key);

  @override
  _SoundsState createState() => _SoundsState();
}

class _SoundsState extends State<Sounds> {

  AudioPlayer audioPlayer = new AudioPlayer();

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ambient Sounds"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tap to play an amibent sound\nTap again to pause\n(An internet connection is required)', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

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
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      print('Rain tapped');
                      getAudio('https://cdn.staticcrate.com/stock-hd/audio/SOUNDSCRATE-RainyDay.mp3');
                    },
                    onLongPress: () {
                      print('rain long tapped');
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
                        Text('Rain')
                      ],
                    ),
                  ),
                ),


                Card(
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      print('Beach waves tapped');
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-loopable-waves-on-beach-windy-1.mp3');
                    },
                    onLongPress: () {
                      print('Beach Waves long tapped');
                      // REFERENCE https://stackoverflow.com/a/45948243
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A relaxing rain sound"),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://icon-library.com/images/air-element-icon/air-element-icon-8.jpg',
                            height: 100),
                        Text('Beach Waves')
                      ],
                    ),
                  ),
                ),


                Card(
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      print('Subway tapped');
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-public-subway-interior-1.mp3');
                    },
                    onLongPress: () {
                      print('Subway long tapped');
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
                        Text('Subway')
                      ],
                    ),
                  ),
                ),


                Card(
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      print('City tapped');
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-city-ambience-4.mp3');
                    },
                    onLongPress: () {
                      print('rain long tapped');
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
                        Text('City')
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      print('Fire tapped');
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-fire.mp3');
                    },
                    onLongPress: () {
                      print('fire long tapped');
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
                        Text('Fire')
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  // REFERENCE: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () {
                      print('Forest tapped');
                      getAudio(
                          'https://cdn.staticcrate.com/stock-hd/audio/soundscrate-forest-ambient.mp3');
                    },
                    onLongPress: () {
                      print('forest long tapped');
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
                        Text('Forest')
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

  void getAudio(String URL) async {

    if(playing){

      print('paused');

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Ambient Sound paused")));


      var res = await audioPlayer.pause();
      if(res == 1){
        setState(() {
          playing = false;
        });
      }

    }else{

      print('playing');

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Ambient Sound playing")));

      
      var res = await audioPlayer.play(URL, isLocal: false);

      if(res == 1){
        setState(() {
          playing = true;
        });
      }
    }
  }
}
