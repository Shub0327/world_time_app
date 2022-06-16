import 'package:flutter/material.dart';

class Choose_Location extends StatefulWidget {
  const Choose_Location({Key? key}) : super(key: key);

  @override
  State<Choose_Location> createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Choose Location"),
        elevation: 0,
        centerTitle: true,
      ),
      body:
      Text("location screen"),

    );
  }
}
