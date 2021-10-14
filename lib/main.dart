import 'package:flutter/material.dart';
import 'package:net_ninja_world_time_app/pages/home.dart';
import 'package:net_ninja_world_time_app/pages/loading.dart';
import 'package:net_ninja_world_time_app/pages/new_location.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'World Time App',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/Locaion': (context) => ChooseLocation(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
        ));
  }
}
