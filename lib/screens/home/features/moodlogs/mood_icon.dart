import 'package:flutter/material.dart';

class MoodIcon extends StatelessWidget {
  String image;
  String name;
  Color colour;

  MoodIcon(
      {Key? key, required this.name, required this.image, required this.colour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 50),
          Text(
            name,
            textAlign: TextAlign.center,
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: colour),
      ),
      height: 100,
    );
  }
}
