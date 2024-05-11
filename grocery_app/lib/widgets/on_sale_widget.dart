import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;

    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          print('On Sale tapped');
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/cat/fruits.png',
                      width: size.width * 0.2,
                      height: size.height * 0.2,
                    ),
                    Column(
                      children: [
                        TextWidget(
                            text: '1 Kg',
                            color: color,
                            textSize: 20,
                            isTitle: true),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const PriceWidget(),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                    text: 'Product title',
                    color: color,
                    textSize: 16,
                    isTitle: true),
                const SizedBox(
                  height: 5,
                ),
              ],
            )),
      ),
    );
  }
}
