import 'dart:ui';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              bottom: 0,
              child: CustomPaint(
                painter: SquigglyLinePainter(),
                child: SizedBox(
                  width: 155,  // Adjust the width to match the width of the "flood" text
                  height: 10,  // Minimal height to fit the squiggly line
                ),
              ),  // Adjust this value based on the exact offset you need
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'flood',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Navy blue color for "flood"
                    ),
                  ),
                  TextSpan(
                    text: 'Care',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for "CARE"
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquigglyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path = Path();
    double y = size.height / 2;
    bool isUp = true;

    // Increase the increment to make each wave section longer
    double increment = 14; // Increased from 10 to 20 for longer waves
    double controlHeight = 10; // Control point height for the wave peak

    for (double x = 0; x <= size.width; x += increment) {
      if (isUp) {
        path.moveTo(x, y);
        // Adjust the control points and end point to extend the width of the wave
        path.quadraticBezierTo(x + increment / 2, y - controlHeight, x + increment, y);
      } else {
        path.moveTo(x, y);
        // Adjust the control points and end point to extend the width of the wave
        path.quadraticBezierTo(x + increment / 2, y + controlHeight, x + increment, y);
      }
      isUp = !isUp;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}