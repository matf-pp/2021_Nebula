import 'package:flutter_app/screens/aqiScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './screens/homeScreen.dart';
import 'loadingData.dart';
import './screens/changeLocation.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // default values - Belgrade
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String str = prefs.getString('city') ?? "Belgrade";
  double lon = prefs.getDouble('lon') ?? 20.4651;
  double lat = prefs.getDouble('lat') ?? 44.804;

  UserData.lon = lon;
  UserData.lat = lat;
  UserData.city = str;

 // await changeLocation.displayText();
  await HomeScreenn.displayText();
  await AqiScreen.displayText();
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: Colors.white10,
      ),
      home: HomeScreen(),
    );
  }
}
