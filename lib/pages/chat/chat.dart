import 'package:flutter/material.dart';
import 'package:tep_app/recources/recources.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int currentSpecies = 0;
  @override
  Widget build(BuildContext context) {
    //
    var displaySize = MediaQuery.of(context).size;
    //
    Widget _speciesbuilder(int i) {
      return GestureDetector(
        onTap: () {
          setState(() {
            currentSpecies = i;
          });
        },
        child: Container(
          width: displaySize.width / 100 * 17.5,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              displaySize.width / 100 * 5,
            ),
            border: Border.all(
              width: 1.5,
              color: (currentSpecies == i)
                  ? Colors.purple.shade800
                  : Colors.grey.shade400,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: EdgeInsets.all(displaySize.width / 100 * 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: (currentSpecies == i)
                          ? Colors.purple.shade800
                          : Colors.grey.shade400,
                    ),
                  ),
                  child: SvgPicture.asset(
                    listSpecies[i].icon,
                    color: (currentSpecies == i)
                        ? Colors.purple.shade800
                        : Colors.grey.shade400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      listSpecies[i].name,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: displaySize.width / 100 * 2.8,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget _doctor(Doctor doctor) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        height: displaySize.height / 100 * 20,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.4),
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  doctor.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const Text('Ish vaqti'),
                const Text('9:00-17:00')
              ],
            ),
            Center(
              child: CircleAvatar(
                radius: displaySize.width / 100 * 10,
                backgroundImage: AssetImage(doctor.image),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: displaySize.height / 100 * 30,
            padding: EdgeInsets.only(
              bottom: displaySize.height / 100 * 2,
              left: displaySize.width / 100 * 6.5,
              right: displaySize.width / 100 * 6.5,
            ),
            decoration: BoxDecoration(
              color: Colors.purple.shade600,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(displaySize.height / 100 * 5),
                bottomRight: Radius.circular(displaySize.height / 100 * 5),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Shifokorni qidirish',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: displaySize.height / 100 * 3.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: displaySize.height / 100 * 3),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: displaySize.height / 100 * 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade800)),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Mutahasisni topish',
                        icon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: displaySize.height / 100 * 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sohalar',
                                style: TextStyle(
                                    fontSize: displaySize.width / 100 * 8,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: displaySize.height / 100 * 13,
                          child: ListView.builder(
                            itemBuilder: (_, index) => _speciesbuilder(index),
                            scrollDirection: Axis.horizontal,
                            itemCount: listSpecies.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: displaySize.height / 100 * 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shifokorlar',
                                    style: TextStyle(
                                        fontSize: displaySize.width / 100 * 8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Hammasi >",
                                      style: TextStyle(
                                          color: Colors.purple.shade700),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      listDoctors.map((e) => _doctor(e)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
