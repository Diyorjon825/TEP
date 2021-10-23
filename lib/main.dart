import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/intro/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'intro_page',
      routes: {
        'intro_page': (context) => const IntroPage(),
        'home_page': (context) => const HomePage(),
      },
    );
  }
}
