import 'package:flutter/material.dart';
import 'package:flutter_playground/bottom_nav_bar.dart';
import 'package:flutter_playground/homepage/title_section.dart';
import 'package:flutter_playground/homepage/wave_header.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue.shade100,
              Colors.lightBlue.shade400,
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: Column(
          children: [
            const WaveHeader(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                "CONTACTING EMERGENCY RESCUE SERVICES...",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                "While you wait",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 68, 113, 167),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Adding an image from assets
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/Emergencycard1.png',  // Replace with your asset path
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
           Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/Emergencycard2.png',  // Replace with your asset path
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomFooter(),
    );
  }
}