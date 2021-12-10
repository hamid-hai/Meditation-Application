import 'package:flutter/material.dart';


class Calm extends StatelessWidget {
  const Calm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calm"),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
