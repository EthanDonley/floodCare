import 'package:flutter/material.dart';
import 'package:flutter_playground/bottom_nav_bar.dart';
import 'package:flutter_playground/homepage/emergency_button.dart';
import 'package:flutter_playground/homepage/flood_risk_button.dart';
import 'package:flutter_playground/homepage/title_section.dart';
import 'package:flutter_playground/homepage/wave_header.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          children: const [
            WaveHeader(),
            TitleSection(),
            FloodRiskButton(),
            EmergencyButton(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomFooter(),
    );
  }
}
