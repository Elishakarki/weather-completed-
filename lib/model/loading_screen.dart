import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:networking/services/location.dart';

import 'package:http/http.dart' as http;
import 'package:networking/services/weather.dart';

import 'location_screen.dart';

const apiKey = "771cc86f3e7ec8b007c8e1e45c108e5d";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

  String apiKey = '771cc86f3e7ec8b007c8e1e45c108e5d';
  @override
  void initState() {
    getLocationData();
    // TODO: implement initState
    super.initState();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }
}
