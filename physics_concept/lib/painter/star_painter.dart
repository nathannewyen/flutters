import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter {
  final int starCount;
  final Random _random = Random();

  StarPainter({this.starCount = 20});

  List<Map<String, double>> generateStarPositions(Size size) {
    List<Map<String, double>> positions = [];
    for (int i = 0; i < starCount; i++) {
      positions.add({
        'x': _random.nextDouble() * (size.width - 20) + 10, // Avoid edges
        'y': _random.nextDouble() * (size.height - 20) + 10, // Avoid edges
        'size': 4 + _random.nextDouble() * 8, // Star size between 4 and 12
        'opacity':
            0.5 + _random.nextDouble() * 0.5, // Opacity between 0.5 and 1.0
      });
    }
    return positions;
  }
}
