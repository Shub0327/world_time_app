import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  @override
  void initState() {
    sendData();
    print("h");
    super.initState();

  }

  void sendData() async {

    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
     print(data['title']);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Loading screen"),


      ),
    );
  }
}

