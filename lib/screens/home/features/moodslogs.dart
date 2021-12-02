import 'package:flutter/material.dart';

class MoodsLogs extends StatefulWidget {
  const MoodsLogs({Key? key}) : super(key: key);

  @override
  _MoodsLogsState createState() => _MoodsLogsState();
}

class _MoodsLogsState extends State<MoodsLogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Mood Logs"),
        backgroundColor: Colors.deepPurple,
      ),


    );
  }
}
