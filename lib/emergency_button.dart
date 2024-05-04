import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({Key? key}) : super(key: key);

  void _handleEmergencyPressed(BuildContext context) async {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: () => _handleEmergencyPressed(context),
        child: const Icon(Icons.warning, size: 100),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(100)),
          backgroundColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(10),
          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 80)),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.orange;
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}