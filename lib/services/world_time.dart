import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {
  String location;
  String time;
  String flag; //url for assets flag icon
  String url; //location url for api endpoint
  bool isDayTime;
  worldTime({this.location,this.flag,this.url});

  Future<void> getData() async {
    Response response = await get('https://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);
    //getting properties from above map data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    String offsetMin = data['utc_offset'].substring(4,6);
    //print('below');
    //print(dateTime);
    //print(offset);
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    now = now.add(Duration(minutes: int.parse(offsetMin)));
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);

  }

}