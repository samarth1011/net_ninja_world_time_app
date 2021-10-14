import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:net_ninja_world_time_app/services/world_time.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'Loading';
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'isDayTime': instance.isDaytime,
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // print("initState function ran");
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SpinKitFadingCube(
                color: Colors.white,
                size: 50.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Loading..',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.white,
                )),
          ],
        ));
    ;
  }
}
