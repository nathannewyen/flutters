import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home_screen.dart';

import 'consts/theme_data.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isDark = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Styles.themeData(true, context),
      home: HomeScreen(),
    );
  }
}
