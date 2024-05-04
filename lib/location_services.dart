import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationServiceHandler {
  final Location location = Location();

  Future<void> initializeLocationService(BuildContext context) async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if location services are enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      // Request the user to enable location services
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // Inform user location services are needed
        return Future.error('Location services are needed for this app to function.');
      }
    }

    // Check if permissions are granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error('Location permissions are needed for this app to function.');
      }
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Location Permission Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                await LocationServiceHandler().initializeLocationService(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Location service is ready to use!')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString())),
                );
              }
            },
            child: Text('Initialize Location Service'),
          ),
        ),
      ),
    );
  }
}