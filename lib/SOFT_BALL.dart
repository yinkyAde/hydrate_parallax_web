import 'package:flutter/material.dart';

class SoftBall extends StatelessWidget {
  const SoftBall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        // Set background color to dark
        color: Colors.black,
        shape: BoxShape.circle,
        // Add a gradient
        gradient: RadialGradient(
          center: Alignment(-0.3, -0.3),
          colors: [
            Colors.white,
            Colors.black.withOpacity(0.75),
          ],
          radius: 1.2,
        ),
        // Add shadows for glowing effect
        boxShadow: [
          BoxShadow(
            // Top left corner
            color: Colors.white.withOpacity(0.2), // Adjust transparency as needed
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(-10.0, -10.0),
          ),
          BoxShadow(
            // Bottom right corner
            color: Colors.white.withOpacity(0.2), // Adjust transparency as needed
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(10.0, 10.0),
          ),
        ],
      ),
      // Add some padding
      padding: const EdgeInsets.all(20.0),
      // Set container to occupy the entire screen
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
