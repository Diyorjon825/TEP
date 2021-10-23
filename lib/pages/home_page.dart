import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 7),
            height: 50,
            width: 50,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.login,
                size: displaySize.height / 100 * 3.3,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.purple.shade600,
        title: const Text('T.E.P'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/images/sd-min.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      'Talabalarning\nElektron\nPoliklinikasi',
                      style: TextStyle(
                          color: Colors.purple.shade600, fontSize: 36),
                    ),
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
      drawer: Container(
        width: displaySize.width / 100 * 70,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: displaySize.height / 100 * 15,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
