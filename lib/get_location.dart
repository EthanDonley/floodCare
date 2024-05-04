import 'package:location/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void getAddressFromLatLng() async {
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  // Check and request service and permission
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) return;
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) return;
  }

  // Get location
  _locationData = await location.getLocation();

  // Geocoding API URL (replace YOUR_API_KEY with your actual Google Maps Geocoding API key)
  String googleAPIUrl = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${_locationData.latitude},${_locationData.longitude}&key=AIzaSyAgmS8A2m6ipqcspm0Xg3TnB217pYlLiR0';

  // Make HTTP request
  var response = await http.get(Uri.parse(googleAPIUrl));
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['results'] != []) {
      // Get formatted address
      String address = jsonResponse['results'][0]['formatted_address'];
      print('Address: $address');

      // Optionally, copy the address to the clipboard or display it in the UI for users to manually input on the GIS site
    }
  } else {
    print('Failed to get address');
  }
}