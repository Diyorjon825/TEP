import 'package:flutter/material.dart';
import 'package:tep_app/pages/chat/chat.dart';
import 'package:tep_app/pages/login_page/login_page.dart';
import 'pages/home_page.dart';
import 'pages/intro/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home_page',
      routes: {
        'intro_page': (context) => const IntroPage(),
        'home_page': (context) => const HomePage(),
        'login_page': (context) => LoginPage(),
        'chat_page': (context) => const ChatPage(),
      },
    );
  }
}
