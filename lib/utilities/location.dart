import 'package:geolocator/geolocator.dart';

class Location {
  double _longitude = 0;
  double _latitude = 0;

  double getLongitude() {
    return _longitude;
  }

  double getLatitude() {
    return _latitude;
  }

  Future<void> getLocation() async {
    try {
      // this is the set of code for asking permission to use Location
      LocationPermission permission = await Geolocator.checkPermission();
      while (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
