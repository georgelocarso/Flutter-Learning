import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longtitude = 0;

  Future<Object> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      latitude = position.latitude;
      longtitude = position.longitude;
      // print(position);

      return position;
      // somethingLessThan10(12);
    } catch (e) {
      print(e);

      return e;
    }
  }
}
