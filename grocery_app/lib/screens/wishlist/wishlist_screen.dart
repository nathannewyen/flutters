import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/screens/wishlist/wishlist_widget.dart';

import '../../services/global_method.dart';
import '../../services/utils.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/text_widget.dart';
import '../cart/empty_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  static const routeName = '/WishlistScreen';

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    bool isEmpty = true;

    if (isEmpty) {
      return const EmptyScreen(
        title: 'Wishlist Empty',
        subTitle: 'Looks like you haven\'t added anything to your wishlist yet',
        buttonText: 'Add a wish',
        imagePath: 'assets/images/wishlist.png',
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const BackWidget(),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Wishlist (2)',
            color: color,
            textSize: 22,
            isTitle: true,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  GlobalMethods.warningDialog(
                    context: context,
                    title: 'Empty wishlist?',
                    subtitle: 'Are you sure?',
                    fct: () {},
                  );
                },
                icon: Icon(
                  IconlyBold.delete,
                  color: color,
                )),
          ],
        ),
        body: MasonryGridView.count(
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return const WishlistWidget();
          },
        ),
      );
    }
  }
}
