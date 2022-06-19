import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data:ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);

    //set background
    String bgImage= data['isDaytime']? 'day.png':'night.png';

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                dynamic result =await Navigator.pushNamed(context, '/location');
                setState(() {
                  data ={
                    'time':result['time'],
                    'location':result['location'],
                    'isDaytime':result['isDaytime'],
                    'flag':result['flag'],
                  };
                });

                },
                icon: Icon(Icons.edit_location_alt), label: Text("Change Location",
                style: TextStyle(
                  color: Colors.black
                ),),),

              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(data['location'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                  ),
                  ),

                ],
              ),

              SizedBox(height: 40,),

              Text(data['time'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                  ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
