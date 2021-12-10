import 'package:flutter/material.dart';


class NHS extends StatelessWidget {
  const NHS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("NHS"),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
