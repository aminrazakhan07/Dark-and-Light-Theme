import 'package:flutter/material.dart';

class DarkThemeScr extends StatefulWidget {
  const DarkThemeScr({super.key});

  @override
  _DarkThemeScrState createState() => _DarkThemeScrState();
}

class _DarkThemeScrState extends State<DarkThemeScr> {
  // Default theme is Light
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Switcher',
      theme: ThemeData.light(), // Light Theme
      darkTheme: ThemeData.dark(), // Dark Theme
      themeMode: isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light, // Apply theme based on isDarkMode
      home: HomePage(
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value; // Update theme based on switch
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const HomePage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Theme',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: onThemeChanged, // Switch the theme
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to second page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: const Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'This is the second page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
