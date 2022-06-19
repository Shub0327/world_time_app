import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime{

  String location="";//location name for ui
  String time=""; //time for the location
  String flag=""; //url of flag asset icon
  String url=""; //location url for api endpoint
  bool isDaytime=false;//true or false if daytime or not

  //name class construtor
  WorldTime({required this.url,required this.location,required this.flag});


  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from api
      String datetime =data['datetime'];
      String utc_offset =data['utc_offset'].substring(1,3);
      String utc_offset2 =data['utc_offset'].substring(4,6);

      // print(datetime);
      // print(utc_offset);


      //creating datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utc_offset), minutes: int.parse(utc_offset2)));
      // print(now);

      //set time property
      isDaytime= now.hour > 6 && now.hour < 20 ;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print('catch error => $e');
      time='could not get the data';
    }

  }

}
