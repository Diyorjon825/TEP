import 'package:flutter/material.dart';

var loginController = TextEditingController();
var passwordController = TextEditingController();

String login = '', password = '';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: displaySize.height / 100 * 17,
            child: const Image(
              image: AssetImage('assets/images/tep.jpg'),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: displaySize.height / 100 * 5.5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            margin: EdgeInsets.only(
              left: displaySize.width / 100 * 6,
              right: displaySize.width / 100 * 6,
              top: displaySize.height / 100 * 3,
            ),
            child: TextField(
              controller: loginController,
              decoration: InputDecoration(
                hintText: 'LogIn',
                hintStyle: TextStyle(color: Colors.grey.shade700),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: displaySize.height / 100 * 5.5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(
              left: displaySize.width / 100 * 6,
              right: displaySize.width / 100 * 6,
              top: displaySize.height / 100 * 2,
            ),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey.shade700),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: displaySize.height / 100 * 8.5,
            padding: EdgeInsets.symmetric(
              horizontal: displaySize.width / 100 * 6,
              vertical: displaySize.height / 100 * 2,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'home_page');
              },
              child: const Text('LogIn'),
            ),
          )
        ],
      ),
    );
  }
}
