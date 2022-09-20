import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;

      print(position);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    //
    // // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('just before service enabled check');
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }
    print('just before service enabled check');
    permission = await Geolocator.checkPermission();
    print('permission $permission');
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    print('check what is in permission $permission');

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // Position Huaweiposition = await Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
// print(Huaweiposition); -- possible Huawei fix?

    try {
      print('request location');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high, timeLimit: Duration(seconds: 5));
      latitude = position.latitude;
      longitude = position.longitude;

      print(position);
    } catch (e) {
      print('in exception state');
      print(e);
    }
  }

}