import 'package:flutter/material.dart';
import 'package:physics_concept/widgets/article_widget.dart';
import 'package:physics_concept/widgets/planets_widget.dart';

import '../widgets/stars_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/Home';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedFilterIndex = 0;

  final List<String> _filters = [
    'All',
    'Planets',
    'Stars',
    'Galaxies',
    'Nebulas',
    'Mars',
    'Jupiter',
    'Saturn',
    'Venus',
    'Mercury',
    'Uranus',
    'Neptune',
    'Earth',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          StarsWidget(
            starCount: 30,
            screenWidth: screenSize.width,
            screenHeight: screenSize.height,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSearchBar(theme, isDarkTheme),
                  const SizedBox(height: 20),
                  _buildCategoryFilters(theme, isDarkTheme),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: const [
                        PlanetCard(
                          planetName: 'Mother Earth',
                          description:
                              'Earth is the third planet from the sun and the only known planet to support life. It has a diameter of 12,742 km.',
                          assetName: 'earth',
                          backgroundColor: Color(0XFFB6F3FF),
                        ),
                        PlanetCard(
                          planetName: 'Venus',
                          description:
                              'Venus is the second planet from the sun and is often referred to as the Earth\'s sister planet.',
                          assetName: 'venus',
                          backgroundColor: Color(0XFFF6E3C4),
                        ),
                        ArticlesSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme, bool isDarkTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: isDarkTheme ? Colors.grey[900] : Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: isDarkTheme ? Colors.white : Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(
                  color: isDarkTheme ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                hintText: 'Search for planets and stars',
                hintStyle: TextStyle(
                    color: isDarkTheme ? Colors.grey[600] : Colors.black),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters(ThemeData theme, bool isDarkTheme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_filters.length, (index) {
          return _buildCustomFilterChip(
              _filters[index], index, theme, isDarkTheme);
        }),
      ),
    );
  }

  Widget _buildCustomFilterChip(
      String label, int index, ThemeData theme, bool isDarkTheme) {
    bool selected = index == _selectedFilterIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedFilterIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: selected
                ? (isDarkTheme ? Colors.white : Colors.black)
                : (isDarkTheme ? Colors.grey[800] : Colors.white),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: selected
                    ? (isDarkTheme ? Colors.white : Colors.black)
                    : Colors.transparent),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: selected
                  ? (isDarkTheme ? Colors.black : Colors.white)
                  : theme.textTheme.titleMedium?.color,
            ),
          ),
        ),
      ),
    );
  }
}
