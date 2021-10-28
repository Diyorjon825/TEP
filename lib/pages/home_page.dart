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
                        color: Colors.purple.shade600,
                        fontSize: 36,
                      ),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: displaySize.height / 100 * 20,
              color: Colors.purple.shade600,
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: displaySize.height / 100 * 3,
                  left: displaySize.width / 100 * 4),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'login_page');
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      size: 30,
                    ),
                    Text(
                      'LogOut',
                      style: TextStyle(fontSize: displaySize.width / 100 * 4.5),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
