import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//   void getData() async {

// // temperateure, condition, cityname
//       var dataTemperature = decodedData['main']['temp'];
//       var dataCondition = decodedData['weather'][0]['id'];
//       var dataCityName = decodedData['name'];

//       print(dataTemperature);
//       print(dataCondition);
//       print(dataCityName);
//     } else {
//       print("API Error, CODE : " + response.statusCode.toString());
//     }
//   }

  void getLocationData() async {
    dynamic weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));

    // print(weatherData);

    // var dataTemperature = weatherData['main']['temp'];
    // var dataCondition = weatherData['weather'][0]['id'];
    // var dataCityName = weatherData['name'];
  }

  // void somethingLessThan10(int n) {
  //   throw "ERROR: something less than 10";
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    // getData();
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
