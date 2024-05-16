import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../services/utils.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/cart.png',
                    width: double.infinity,
                    height: size.height * 0.4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Whoops!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                      text: 'No item in your cart yet!',
                      color: Colors.cyan,
                      textSize: 20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
