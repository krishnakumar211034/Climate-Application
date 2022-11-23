import 'package:flutter/material.dart';

const apiKey = '4f839e9983e17bbe2df037d2b7cabe32';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city),
  hintText: "Enter City Name",
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);
