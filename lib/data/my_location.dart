import 'package:geolocator/geolocator.dart';

class MyLocation {
  double latitude2;
  double longtitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      latitude2 = position.latitude;
      longtitude2 = position.longitude;
    }catch(e) {
      print("There was a problem with internet connection");
    }
  }
}