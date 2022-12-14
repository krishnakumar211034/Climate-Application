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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
