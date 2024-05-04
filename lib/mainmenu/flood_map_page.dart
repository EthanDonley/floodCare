import 'package:flutter/material.dart';
import 'package:flutter_playground/bottom_nav_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class Page1 extends StatelessWidget {

  void openFloodMap(BuildContext context) async {
    try {
      // Get the current location
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // Construct the URL
      String url = 'https://gis.lfpz.water.ca.gov/lfpz/?lat=${position.latitude}&lon=${position.longitude}';
      
      if (!await launch(url)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      // Handle exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to get location or open the URL: $e'),
          backgroundColor: Colors.red,
        ),
      );
      
    }
  }

  
  @override
  Widget build(BuildContext context) {
    openFloodMap(context);
    return Scaffold(
      appBar: AppBar(title: Text("Flood Map")),
      body: Center(
        child: Image.asset(
          'assets/images/placeholder_map.png',
          fit: BoxFit.contain,
        ),
      ),
      bottomNavigationBar: const CustomFooter(),
    );
  }

  
}