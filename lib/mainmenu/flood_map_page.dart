import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flood Map")),
      body: Center(
        child: Image.asset(
          'assets/images/placeholder_map.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}