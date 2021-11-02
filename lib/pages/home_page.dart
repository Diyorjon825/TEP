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

    Widget drawerButton(String name) {
      return Container(
        padding:
            EdgeInsets.symmetric(horizontal: displaySize.width / 100 * 1.4),
        width: double.infinity,
        margin: EdgeInsets.only(top: displaySize.height / 100 * 3),
        height: displaySize.height / 100 * 5,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple.shade600),
          ),
          onPressed: () {},
          child: Text(name),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade600,
        title: const Text('T.E.P'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              const SizedBox(height: 10),
              GestureDetector(
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 110,
                        child: Row(
                          children: const [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/doctors.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Shifokor bilan aloqa',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Sizni qiynayotgan savollarga tajribali shifokorlardan javob oling',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 35,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'chat_page');
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Container(
        width: displaySize.width / 100 * 70,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: displaySize.height / 100 * 20,
              padding: EdgeInsets.all(displaySize.height / 100 * 2),
              color: Colors.purple.shade600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: displaySize.height / 100 * 2),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: displaySize.height / 100 * 4.5,
                        backgroundImage:
                            const AssetImage('assets/images/avatar2.png'),
                        backgroundColor: Colors.purple.shade600,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: displaySize.height / 100 * 2.3,
                              ),
                            ),
                            Text(
                              'Surname',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: displaySize.height / 100 * 2.3,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    'email@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: displaySize.height / 100 * 2.2,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  drawerButton('Bizning Jamoa'),
                  drawerButton('Biz haqimizda'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: displaySize.height / 100 * 3,
                left: displaySize.width / 100 * 4,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'login_page');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.purple.shade600,
                    ),
                    Text(
                      'LogOut',
                      style: TextStyle(
                        fontSize: displaySize.width / 100 * 4.5,
                        color: Colors.purple.shade600,
                        fontWeight: FontWeight.w400,
                      ),
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
