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
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
      child: ElevatedButton(
        onPressed: () => _handleEmergencyPressed(context),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const CircleBorder(side: BorderSide(color: Colors.white, width: 4)), // White stroke around the button
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)), // Adjusted for optimal layout
          backgroundColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(10),
          minimumSize: MaterialStateProperty.all(const Size(300, 300)), // Increased size to fit contents
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.orange; // Splash color when pressed
              }
              return null;
            },
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min, // Ensures the column only takes the space it needs
          children: [
            Icon(Icons.warning_rounded, size: 100, color: Colors.white), // Icon size adjusted
            SizedBox(height: 8), // Space between icon and text
            Text(
              "I'M IN AN EMERGENCY!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, // Font size adjusted for readability
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
