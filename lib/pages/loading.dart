import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {



  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
void setupWorldTime() async{
  worldTime instance = worldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata' );
  await instance.getData();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location':instance.location, 'flag':instance.flag, 'url':instance.url, 'time':instance.time, 'isDayTime':instance.isDayTime,
  });
}

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 30.0,
        ),

      )
    );
  }
}
