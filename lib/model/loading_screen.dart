import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:networking/model/location.dart';

import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  String apiKey = '771cc86f3e7ec8b007c8e1e45c108e5d';
  @override
  void initState() {
    getLocation();
    // TODO: implement initState
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=771cc86f3e7ec8b007c8e1e45c108e5d'));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      double temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]["id"];
      String cityname = decodeData['name'];
      print(temperature);
      print(condition);
      print(cityname);
    }
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
