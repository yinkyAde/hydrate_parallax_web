import 'package:flutter/material.dart';

class SoftTorchEffect extends StatelessWidget {
  const SoftTorchEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        //color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            // Top left corner
            color: Colors.white.withOpacity(0.2), // Adjust transparency as needed
            blurRadius: 100.0,
            spreadRadius: 10.0,
            offset: Offset(-10.0, -10.0),
          ),
          BoxShadow(
            // Bottom right corner
            color: Colors.white.withOpacity(0.2), // Adjust transparency as needed
            blurRadius: 100.0,
            spreadRadius: 5.0,
            offset: Offset(10.0, 10.0),
          ),
        ],
      ),
    );
  }
}
