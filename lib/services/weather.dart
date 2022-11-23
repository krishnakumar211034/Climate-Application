import '../utilities/constants.dart';
import '../utilities/location.dart';
import 'networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    NetworkingHelper network = NetworkingHelper(
      '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric',
    );
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location currentLocation = Location();
    await currentLocation.getLocation();
    double longitude = currentLocation.getLatitude();
    double latitude = currentLocation.getLongitude();
    NetworkingHelper network = NetworkingHelper(
      '$openWeatherMapURL?lat=${latitude.toStringAsFixed(4)}&lon=${longitude.toStringAsFixed(4)}&appid=$apiKey&units=metric',
    );
    var weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
