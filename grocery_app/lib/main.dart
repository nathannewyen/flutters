import 'package:flutter/material.dart';
import 'package:grocery_app/inner_screens/feeds_screen.dart';
import 'package:grocery_app/inner_screens/on_sale_screen.dart';
import 'package:grocery_app/inner_screens/product_details_screen.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/btm_bar.dart';
import 'package:grocery_app/screens/viewed_recently/viewed_recently_screen.dart';
import 'package:grocery_app/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

import 'consts/theme_data.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grocery App',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const BottomBarScreen(),
          routes: {
            OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
            FeedsScreen.routeName: (ctx) => const FeedsScreen(),
            ProductDetailsScreen.routeName: (ctx) =>
                const ProductDetailsScreen(),
            WishlistScreen.routeName: (ctx) => const WishlistScreen(),
            ViewedRecentlyScreen.routeName: (ctx) =>
                const ViewedRecentlyScreen(),
          },
        );
      }),
    );
  }
}
