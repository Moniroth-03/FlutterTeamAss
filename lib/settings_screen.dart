import 'package:flutter/material.dart';
import 'package:flutter_team_assignment/third_screen.dart'; // Make sure this import points to your ThirdScreen file

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Screen',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  void _navigateTo(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(title: title)),
    );
  }

  void _navigateToLogout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ThirdScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Profile & Account Settings'),
            onTap: () => _navigateTo(context, 'Profile & Account Settings'),
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () => _navigateTo(context, 'Notifications'),
          ),
          ListTile(
            title: Text('Reading Preferences'),
            onTap: () => _navigateTo(context, 'Reading Preferences'),
          ),
          ListTile(
            title: Text('Dark Mode'),
            onTap: () => _navigateTo(context, 'Dark Mode'),
            trailing: Text('Auto'),
          ),
          ListTile(
            title: Text('Premium Subscription'),
            onTap: () => _navigateTo(context, 'Premium Subscription'),
          ),
          ListTile(
            title: Text('Customize Theme'),
            onTap: () => _navigateTo(context, 'Customize Theme'),
          ),
          ListTile(
            title: Text('Blocked Accounts'),
            onTap: () => _navigateTo(context, 'Blocked Accounts'),
          ),
          ListTile(
            title: Text('Muted Accounts'),
            onTap: () => _navigateTo(context, 'Muted Accounts'),
          ),
          ListTile(
            title: Text('Language'),
            onTap: () => _navigateTo(context, 'Language'),
            trailing: Text('English'),
          ),
          ListTile(
            title: Text('About Wattpad'),
            onTap: () => _navigateTo(context, 'About Wattpad'),
          ),
          ListTile(
            title: Text('Help & Support'),
            onTap: () => _navigateTo(context, 'Help & Support'),
          ),
          ListTile(
              title: Text('Log Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              }),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;

  DetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details for $title'),
      ),
    );
  }
}
