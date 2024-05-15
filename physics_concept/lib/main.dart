import 'package:flutter/material.dart';
import 'package:physics_concept/provider/dark_theme_provider.dart';
import 'package:physics_concept/screens/home.dart';
import 'package:physics_concept/screens/on_boarding.dart';
import 'package:provider/provider.dart';

import 'constants/theme_data.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

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
          title: 'Universe Explore',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const OnBoardingScreen(),
          routes: {
            HomeScreen.routeName: (ctx) => const HomeScreen(),
          },
        );
      }),
    );
  }
}
