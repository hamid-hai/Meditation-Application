import 'package:flutter/material.dart';

class AdvertRemoval extends StatefulWidget {
  const AdvertRemoval({Key? key}) : super(key: key);

  @override
  _AdvertRemovalState createState() => _AdvertRemovalState();
}

class _AdvertRemovalState extends State<AdvertRemoval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Advert Removal"),
        backgroundColor: Colors.deepPurple,
      ),


    );
  }
}
