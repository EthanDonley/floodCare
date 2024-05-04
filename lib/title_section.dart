import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
          'FLOODCARE',
          style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    );
  }
}