import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';
import '../widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  final List<Map<String, dynamic>> categoryInfo = [
    {'categoryText': 'Fruits', 'imgPath': 'assets/images/cat/fruits.png'},
    {'categoryText': 'Vegetables', 'imgPath': 'assets/images/cat/veg.png'},
    {'categoryText': 'Herbs', 'imgPath': 'assets/images/cat/Spinach.png'},
    {'categoryText': 'Nuts', 'imgPath': 'assets/images/cat/nuts.png'},
    {'categoryText': 'Spices', 'imgPath': 'assets/images/cat/spices.png'},
    {'categoryText': 'Grains', 'imgPath': 'assets/images/cat/grains.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Categories',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 20, // Vertical Spacing
          mainAxisSpacing: 20, // Horizontal Spacing
          children: List.generate(6, (index) {
            return CategoriesWidget(
              categoryText: categoryInfo[index]['categoryText'],
              imgPath: categoryInfo[index]['imgPath'],
              passedColor: gridColors[index],
            );
          }),
        ),
      ),
    );
  }
}
