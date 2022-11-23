import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen(this.locationWeather, {super.key});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  bool isError = false;
  late int id = 0;
  late double temp = 0;
  late String cityName = "Error has occurred..";
  late var weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherData = widget.locationWeather;
  }

  void updateUI() {
    if (weatherData == null) {
      isError = false;
      return;
    }
    print("Location: ${weatherData["name"]}");
    setState(() {
      id = weatherData["weather"][0]["id"];
      temp = weatherData["main"]["temp"];
      cityName = weatherData["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    updateUI();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      var data = await weather.getWeatherData();
                      weatherData = data;
                      updateUI();
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedCityName != null) {
                        var Data = await weather.getCityWeatherData(typedCityName);
                        weatherData = Data;
                        // print("$typedCityName in city screen");
                        // print("${weatherData["name"]} in city screen");
                        updateUI();
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      isError ? '0' : '${temp.toStringAsFixed(0)}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      isError ? "" : weather.getWeatherIcon(id),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                  right: 5,
                  left: 5,
                ),
                child: Text(
                  cityName == ""
                      ? weather.getMessage(temp.toInt())
                      : "${weather.getMessage(temp.toInt())} in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
