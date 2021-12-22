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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Ambient Sounds"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              primary: false,
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
                        Image.asset(
                            'assets/images/userdashboard/audiowaves.png',
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
                        Image.asset(
                            'assets/images/userdashboard/audiowaves.png',
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
                        Image.asset(
                            'assets/images/userdashboard/audiowaves.png',
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
                        Image.asset(
                            'assets/images/userdashboard/audiowaves.png',
                            height: 100),
                        Text('City')
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
