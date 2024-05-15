import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(theme, isDarkTheme),
            const SizedBox(height: 20),
            _buildCategoryFilters(theme, isDarkTheme),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme, bool isDarkTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: isDarkTheme ? Colors.grey[900] : Colors.grey[200],
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: isDarkTheme ? Colors.white : Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(
                  color: isDarkTheme ? Colors.white : Colors.black,
                  fontSize: 16,
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

    return InkWell(
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
    );
  }
}
