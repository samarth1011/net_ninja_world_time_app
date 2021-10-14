import 'package:flutter/material.dart';
import 'package:net_ninja_world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Africa', flag: 'nairobi.png'),
    WorldTime(url: 'America/Jamaica', location: 'Jamaica', flag: 'jamaica.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'paris.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Pakistan', flag: 'pakistan.jpg'),
    WorldTime(
        url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hong_kong.png'),
    WorldTime(
        url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(
        url: 'Indian/Maldives', location: 'Maldives', flag: 'maldives.jpg'),
    WorldTime(
        url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
  ];
  void getTimeForLocation(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home scren
    Navigator.pop(context, {
      'isDayTime': instance.isDaytime,
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Choose Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                  child: ListTile(
                onTap: () {
                  getTimeForLocation(index);
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/' + (locations[index].flag!)),
                ),
                title: Text(locations[index].location!),
              )),
            );
          },
          itemCount: locations.length,
        ));
  }
}
