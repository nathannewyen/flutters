import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../services/utils.dart';
import '../../widgets/text_widget.dart';
import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Cart (2)',
            color: color,
            textSize: 22,
            isTitle: true,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyBold.delete,
                  color: color,
                )),
          ],
        ),
        body: Column(
          children: [
            _checkout(context: context),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return const CartWidget();
                },
              ),
            ),
          ],
        ));
  }

  Widget _checkout({required BuildContext context}) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: 'Order Now',
                    textSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: 'Total: \$0.29',
                textSize: 18,
                color: color,
                isTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
