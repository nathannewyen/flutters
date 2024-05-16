import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:physics_concept/painter/star_painter.dart';

class StarsWidget extends StatelessWidget {
  final int starCount;
  final double screenWidth;
  final double screenHeight;

  const StarsWidget({
    super.key,
    required this.starCount,
    required this.screenWidth,
    required this.screenHeight,
  });

  List<Widget> _generateRandomStars() {
    final starPainter = StarPainter(starCount: starCount);
    final starPositions =
        starPainter.generateStarPositions(Size(screenWidth, screenHeight));
    return starPositions.map((position) {
      return positionedSvg(
        'star',
        left: position['x'],
        top: position['y'],
        width: position['size']!,
        height: position['size']!,
        opacity: position['opacity']!,
      );
    }).toList();
  }

  Widget positionedSvg(String assetName,
      {double? top,
      double? bottom,
      double? left,
      double? right,
      required double width,
      required double height,
      required double opacity}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: SvgPicture.asset(
        'assets/svgs/$assetName.svg',
        width: width,
        height: height,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _generateRandomStars(),
    );
  }
}
