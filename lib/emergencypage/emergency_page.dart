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
        child: const Column(
          children: [
            WaveHeader(),
            TitleSection(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomFooter(),
    );
  }
}
