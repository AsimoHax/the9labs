import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('Location services are disabled.');
        _assignDefaultLocation();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          debugPrint('Location permissions are denied');
          _assignDefaultLocation();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        debugPrint('Location permissions are permanently denied.');
        _assignDefaultLocation();
        return;
      }
      Position? position = await Geolocator.getLastKnownPosition();

      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 5), 
      );

      position ??= await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      latitude = position.latitude;
      longitude = position.longitude;
      debugPrint('Location retrieved: $latitude, $longitude');

    } catch (e) {
      debugPrint('Error or Timeout getting location: $e');
      _assignDefaultLocation();
    }
  }

  void _assignDefaultLocation() {
    //Ha Noi
    latitude = 21.0285;
    longitude = 105.8542;
  }
}