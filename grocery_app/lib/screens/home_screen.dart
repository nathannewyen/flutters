import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        body: Center(
      child: SwitchListTile(
        title: Text(
          'Theme',
          style: TextStyle(
            color: themeState.getDarkTheme
                ? const Color(0xFFE8FDFD)
                : const Color(0xFF1a1f3c),
          ),
        ),
        secondary: Icon(themeState.getDarkTheme
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined),
        onChanged: (bool value) {
          setState(() {
            themeState.setDarkTheme = value;
          });
        },
        value: themeState.getDarkTheme,
      ),
    ));
  }
}
