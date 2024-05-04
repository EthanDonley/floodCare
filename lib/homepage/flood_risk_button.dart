import 'package:flutter/material.dart';

class FloodRiskButton extends StatelessWidget {
  const FloodRiskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      child: ElevatedButton(
        onPressed: () {
          // Add your functionality for checking flood risk
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(  // Rounded Rectangle Border
            borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
            side: const BorderSide(color: Colors.white, width: 2), // White border
          ),
          elevation: 5,  // Shadow depth, adjust as necessary
          minimumSize: Size(400, 100),
          shadowColor: Colors.black.withOpacity(0.5),  // Shadow color with some transparency
        ),
        child: const Text('ARE YOU AT RISK OF A FLOOD?'),
      ),
    );
  }
}