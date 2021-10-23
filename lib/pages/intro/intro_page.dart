import 'package:flutter/material.dart';

class InfoPage {
  String title, image;
  InfoPage(this.title, this.image);
}

List<InfoPage> infoPages = [
  InfoPage(
    "Biz kelajagimiz egalarining solomatligi uchun mas'ulmiz",
    'assets/images/doctor_PNG16022.png',
  ),
  InfoPage(
    "Enjoy lifetime access to courses on Udemy’s website and app",
    'assets/images/doctor_PNG16022.png',
  ),
];

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple.shade600,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            children: infoPages.map((info) => PageWidget(info: info)).toList(),
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          Positioned(
            bottom: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                indecator(),
              ],
            ),
          ),
          Positioned(
            bottom: displaySize.height / 100 * 8.8,
            right: 20,
            child: (currentPage == infoPages.length - 1)
                ? TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home_page');
                    },
                    child: Text(
                      "Ro'yhatdan o'tish",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: displaySize.width / 100 * 4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  Widget indecator() {
    var list = <Widget>[];
    for (int i = 0; i < infoPages.length; i++) {
      if (currentPage == i) {
        list.add(dots(false));
      } else {
        list.add(dots(true));
      }
    }
    return Row(
      children: list,
    );
  }

  Widget dots(bool a) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      duration: const Duration(milliseconds: 200),
      height: 6,
      width: a ? 6 : 30,
    );
  }
}

class PageWidget extends StatelessWidget {
  InfoPage info;
  PageWidget({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: displaySize.height / 100 * 12),
          SizedBox(
            height: displaySize.height / 100 * 48,
            child: Image(
              image: AssetImage(info.image),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: displaySize.height / 100 * 2),
          Text(
            info.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
