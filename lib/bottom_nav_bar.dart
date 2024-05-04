import 'package:flutter/material.dart';

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
        // Handle navigation logic here
      },
      selectedIndex: 0,  // Default selected index, set it as per your navigation logic
    );
  }
}
