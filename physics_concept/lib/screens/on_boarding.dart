import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF0E0E0E),
        child: SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                        text: 'Journey through the cosmos \nwith our space app',
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
          ),
        ),
      ),
    );
  }
}
