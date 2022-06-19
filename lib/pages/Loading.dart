import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  // String time="loading....";

  @override
  void initState() {
    setWorldTime();
    super.initState();

  }

  void setWorldTime() async {
    WorldTime instance =
        WorldTime(url: 'Asia/Kolkata',location: 'India', flag: 'India.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime' :instance.isDaytime,
    });
    // print(instance.time);
    // setState(() {
    //   time=instance.time;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Center(
      child:
         SpinKitSpinningLines(
        color: Colors.white,
        size: 50.0,
       ),
        ),
      );
  }
}


