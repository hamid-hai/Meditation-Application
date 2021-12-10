import 'package:flutter/material.dart';


class Shout extends StatelessWidget {
  const Shout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shout"),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
