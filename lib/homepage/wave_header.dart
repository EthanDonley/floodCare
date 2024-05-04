import 'dart:math' as math;
import 'package:flutter/material.dart';

class WaveHeader extends StatefulWidget {
  const WaveHeader({super.key});

  @override
  _WaveHeaderState createState() => _WaveHeaderState();
}

class _WaveHeaderState extends State<WaveHeader> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePainter(animation.value),
      child: Container(height: 0),
    );
  }
}

class WavePainter extends CustomPainter {
  final double waveAnimation;

  WavePainter(this.waveAnimation);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue[400]!
      ..style = PaintingStyle.fill;

    var path = Path();

    double y1 = size.height;
    double amplitude = 10; // Height of the wave
    double frequency = 3; // Frequency of the wave
    path.moveTo(size.width, y1);
    path.lineTo(0, y1);
    double offset = 30; // Offset of the wave
    for (double i = 0; i < size.width; i++) {
      y1 = offset + size.height - amplitude * math.sin((i / size.width * frequency * math.pi) + waveAnimation);
      path.lineTo(i, y1);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Your existing widgets
            ],
          ),
          WaveHeader(), // Positioned at the top
        ],
      ),
    );
  }
}
