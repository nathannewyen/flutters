import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlanetCard extends StatelessWidget {
  final String planetName;
  final String description;
  final String assetName;
  final Color backgroundColor;

  const PlanetCard({
    super.key,
    required this.planetName,
    required this.description,
    required this.assetName,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          width: 200, // Fixed width for the card
          height: 250, // Fixed height for the card
          margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 8.0), // Added horizontal margin for spacing
          decoration: BoxDecoration(
            color: isDarkTheme
                ? Colors.grey[800]
                : backgroundColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50), // Space for the floating SVG
                Text(
                  planetName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkTheme ? Colors.white70 : Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -80, // Adjust this value to move the SVG up or down
          left: 0, // Adjust this value to move the SVG left or right
          child: SvgPicture.asset(
            'assets/svgs/$assetName.svg',
            width: 180,
            height: 180,
          ),
        ),
      ],
    );
  }
}
