import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/text_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF0E0E0E),
        child: SafeArea(
          child: Stack(
            children: [
              positionedSvg('earth',
                  bottom: 90, left: 20, width: 500, height: 500),
              positionedSvg('mercury',
                  top: 330, left: 20, width: 200, height: 200),
              positionedSvg('venus',
                  top: 250, right: 30, width: 220, height: 220),
              positionedSvg('mars',
                  bottom: -10, right: 10, width: 300, height: 300),
              positionedSvg('venus_ring',
                  bottom: 50, left: 20, width: 196, height: 170),
              positionedSvg('star', top: 400, left: 180, width: 15, height: 15),
              positionedSvg('star', top: 330, left: 80, width: 10, height: 10),
              positionedSvg('star',
                  top: 300, right: 180, width: 10, height: 10),
              positionedSvg('star', top: 420, right: 30, width: 10, height: 10),
              positionedSvg('star', top: 620, left: 30, width: 8, height: 8),
              positionedSvg('star', top: 540, right: 60, width: 10, height: 10),
              positionedSvg('star',
                  bottom: 220, right: 60, width: 10, height: 10),
              positionedSvg('star',
                  bottom: 180, left: 160, width: 15, height: 15),
              positionedSvg('star', bottom: 60, left: 120, width: 8, height: 8),
              positionedSvg('star',
                  bottom: 100, right: 220, width: 10, height: 10),
              // Text and button
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Explore the Universe',
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 16.0),
                        TextWidget(
                          text:
                              'Journey through the cosmos \nwith our space app',
                          fontSize: 18,
                          color: Color(0xFFB4B4B4),
                          height: 1.375,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle button press
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xFF0E0E0E),
                            // backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Adjust this value as needed
                            ),
                          ),
                          child: const TextWidget(
                            text: 'Get Started',
                            fontSize: 16,
                            color: Color(0xFF0E0E0E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget star(double width, double height) {
    return SvgPicture.asset(
      'assets/svgs/star.svg',
      width: width,
      height: height,
    );
  }

  Widget positionedSvg(String assetName,
      {double? top,
      double? bottom,
      double? left,
      double? right,
      required double width,
      required double height}) {
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
}
