import 'package:flutter/material.dart';
import 'package:flutter_playground/emergency_button.dart';
import 'package:flutter_playground/flood_risk_button.dart';
import 'package:flutter_playground/title_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: const Column(
        children: [
          TitleSection(),
          FloodRiskButton(),
          EmergencyButton(),
        ],
      ),
    );
  }
}