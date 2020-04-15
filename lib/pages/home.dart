import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;

String bgcolour ;
bgcolour = data['isDayTime'] ? 'sun.png' :'moon.png';


  return Scaffold(
    backgroundColor: Colors.grey[900],

      body: SafeArea(
          child: Container(
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/$bgcolour'),
//                fit: BoxFit.cover,
//              )
//            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
            FlatButton.icon(onPressed: () async{
              dynamic result = await Navigator.pushNamed(context, '/location');
              setState(() {

                data = {
                  'time': result['time'],
                  'location':result['location'],
                  'flag': result['flag'],
                  'isDayTime':result['isDayTime'],
              };}
                );
            },
            icon: Icon(Icons.edit_location,color: Colors.deepPurpleAccent,),
                label: Text(
                'Edit Location',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
            )),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.deepPurpleAccent,
                  ),
                ),

              ],
            ),
            SizedBox(height: 20.0),
            Text(
            data['time'],
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,
            ),
            ),
             SizedBox(height: 50.0,),
             Center(
               child: CircleAvatar(
                 backgroundColor: Colors.grey[900],
                 backgroundImage: AssetImage('assets/$bgcolour'),
                 radius: 40.0,
               ),
             ),
        ],
      ),
          )),
      );
  }
}
