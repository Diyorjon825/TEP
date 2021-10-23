import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: "TeleMed online tibbiyot platformasi tarmog'idagi",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              TextSpan(
                text: "Talabalarning Elektron Poliklinikasi",
                style: TextStyle(color: Colors.blue, fontSize: 26),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
