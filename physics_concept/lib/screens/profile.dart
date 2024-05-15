import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    final bool isDarkTheme = themeState.getDarkTheme;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'My Account'),
          _buildListTile(context, 'Account & Security'),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Settings'),
          _buildListTile(context, 'Notifications Settings'),
          _buildListTile(context, 'Privacy Settings'),
          _buildListTile(context, 'Language'),
          SwitchListTile(
            title: TextWidget(
              text: isDarkTheme ? 'Dark Mode' : 'Light Mode',
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            value: isDarkTheme,
            activeTrackColor: Colors.green,
            onChanged: (bool value) {
              themeState.setDarkTheme = value;
            },
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Support'),
          _buildListTile(context, 'Help Center'),
          _buildListTile(context, 'Community Rules'),
          _buildListTile(context, 'About'),
          _buildListTile(context, 'Delete Account'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Handle navigation or actions here
          },
        ),
        const Divider(),
      ],
    );
  }
}
