import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocationData() async {
    var weatherData = await WeatherModel().getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          print("reached the location");
          return LocationScreen(weatherData);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.blue,
          size: 100,
        ),
      ),
    );
  }
}

// {
//   "coord":{"lon":13.0071,"lat":74.7971},
//   "weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],
//   "base":"stations",
//   "main":{"temp":276.82,"feels_like":273.85,"temp_min":276.82,"temp_max":276.82,"pressure":1020,"humidity":61,"sea_level":1020,"grnd_level":1020},
//   "visibility":10000,
//   "wind":{"speed":3.28,"deg":121,"gust":3.4},
//   "clouds":{"all":85},
//   "dt":1669181799,
//   "sys":{"sunrise":0,"sunset":0},
//   "timezone":3600,
//   "id":0,
//   "name":"",
//   "cod":200
// }
