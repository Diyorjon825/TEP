import 'package:flutter/material.dart';
import 'package:tep_app/recources/recources.dart';

import 'chat/chat.dart';
import 'chat/chats.dart';
import 'home/home.dart';
import 'profile_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //          values
  //
  int selectedPage = 0;
  //
  //        Widgets
  //

  @override
  Widget build(BuildContext context) {
    List<Widget> listPages = [
      //            first page
      const Home(),
      //          second page
      const ChatsPage(),
      //          third page
      const ProfilePage(),
    ];

    //
    //                Main function
    //
    return Scaffold(
      body: listPages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: SystemColors.navigationColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.9),
      ),
    );
  }
}
