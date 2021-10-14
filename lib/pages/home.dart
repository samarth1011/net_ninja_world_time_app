import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/' + bgImage), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/Locaion');
                    setState(() {
                      data = {
                        'isDayTime': result['isDayTime'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                      };
                    });
                  },
                  label: Text('Edit Locations',
                      style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.edit_location, color: Colors.grey[300])),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlowText(data['location'],
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        color: Colors.white,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Text(data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    letterSpacing: 2,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Colors.red,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //       backgroundColor: Colors.green,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'School',
      //       backgroundColor: Colors.purple,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //       backgroundColor: Colors.pink,
      //     ),
      //   ],
      //   currentIndex: 0,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: (i) {},
      // ),
    );
  }
}
