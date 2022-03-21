import 'package:balloon_navigation_bar/screens/home_screen.dart';
import 'package:balloon_navigation_bar/src/ballon_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Balloon Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff161F35),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xff1da2ff),
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 25.0,
          ),
          unselectedIconTheme: IconThemeData(
            color: Color(0xff526187),
            size: 25.0,
          ),
        ),
      ),
      home: const NavigationScreen(),
    );
  }
}

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff273559),
      appBar: AppBar(
        backgroundColor: const Color(0xff161F35),
        title: const Text('Ballon Navigation Bar'),
      ),
      body: Column(),
      bottomNavigationBar: BallonNavigationBar(
        onPress: (value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        ),
        items: const [],
      ),
    );
  }
}
