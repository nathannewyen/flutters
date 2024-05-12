import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/widgets/heart_btn_widget.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void dispose() {
    _quantityTextController.text = '1';
    super.dispose();
  }

  @override
  void initState() {
    _quantityTextController.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(children: [
            FancyShimmerImage(
              imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              height: size.width * 0.21,
              width: size.width * 0.21,
              boxFit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Title',
                    color: color,
                    textSize: 20,
                    isTitle: true,
                  ),
                  const HeartBTN(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PriceWidget(),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        FittedBox(
                          child: TextWidget(
                            text: 'KG',
                            color: color,
                            textSize: 18,
                            isTitle: true,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: _quantityTextController,
                          keyboardType: TextInputType.number,
                          key: const ValueKey('10'),
                          style: TextStyle(color: color, fontSize: 18),
                          maxLines: 1,
                          enabled: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).cardColor),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                  ),
                ),
                child: TextWidget(
                  text: 'Add to Cart',
                  maxLines: 1,
                  color: color,
                  textSize: 20,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
