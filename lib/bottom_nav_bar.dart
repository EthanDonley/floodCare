import 'package:flutter/material.dart';
import 'package:flutter_playground/emergencypage/emergency_page.dart';
import 'package:flutter_playground/homepage/homepage.dart';
import 'package:flutter_playground/homepage/information.dart';

class CustomFooter extends StatelessWidget {

  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.warning_rounded),
          label: 'Emergency',
        ),
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.info),
          label: 'Information',
        ),
      ],
      onDestinationSelected: (int index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmergencyPage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FloodInformationPage()),
          );
        }
      },
    );
  }
}
