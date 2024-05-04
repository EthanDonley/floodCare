import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          // Add your functionality for emergency actions
        },
        child: const Icon(Icons.warning, size: 100),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(100)),
          backgroundColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(10),
          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 80)),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.orange;
              }
              return null;
            },
          ),
          side: MaterialStateProperty.all(BorderSide(color: Colors.white, width: 2)),
        ),
      ),
    );
  }
}