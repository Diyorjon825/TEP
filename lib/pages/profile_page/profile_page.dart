import 'package:flutter/material.dart';
import 'package:tep_app/recources/recources.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    //varable
    final displaySize = MediaQuery.of(context).size;
    //
    // Widgets
    //
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: displaySize.height / 100 * 7),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: displaySize.width / 100 * 20,
              backgroundImage: AssetImage(user1.image),
            ),
            const SizedBox(height: 10),
            Text(
              user1.name,
              style: TextStyle(fontSize: displaySize.height / 100 * 3.5),
            ),
            Text(
              user1.surname,
              style: TextStyle(fontSize: displaySize.height / 100 * 3.5),
            ),
            Text(
              '${user1.age} yosh',
              style: TextStyle(fontSize: displaySize.height / 100 * 3),
            ),
          ],
        ),
      ),
    );
  }
}
