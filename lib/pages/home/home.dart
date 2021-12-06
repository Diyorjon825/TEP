import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tep_app/controller/home_page_controller.dart';
import 'package:tep_app/network/get_from_internet.dart';
import 'package:tep_app/recources/recources.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _model = HomePageModel();
  @override
  Widget build(BuildContext context) {
    return HomePageProvider(child: const _MainWidget(), model: _model);
  }
}

class _MainWidget extends StatefulWidget {
  const _MainWidget({Key? key}) : super(key: key);

  @override
  State<_MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<_MainWidget> {
  var controllerText = TextEditingController();

  void listener() {
    HomePageProvider.of(context)?.model.controllerListener(controllerText);
  }

  void getDoctors() async {
    await getInfo();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controllerText.addListener(listener);
    getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;

    Widget _appBar() {
      return SliverAppBar(
        pinned: true,
        stretch: true,
        backgroundColor: SystemColors.firstColor,
        expandedHeight: displaySize.height / 100 * 14,
        flexibleSpace: const FlexibleSpaceBar(
          background: Image(
            image: AssetImage('assets/images/medical.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: displaySize.height / 100 * 4.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey.shade800)),
          child: Center(
            child: TextField(
              controller: controllerText,
              decoration: InputDecoration(
                hintText: 'Mutaxassisni topish',
                hintStyle: TextStyle(fontSize: displaySize.height / 100 * 2),
                icon: const Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      );
    }

    Widget _speciesbuilder(int i) {
      return GestureDetector(
        onTap: () {
          HomePageProvider.of(context)?.model.sortDoctorsWithButtons(i);
        },
        child: Container(
          width: displaySize.width / 100 * 20,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              displaySize.width / 100 * 5,
            ),
            border: Border.all(
              width: 1.5,
              color: (HomePageProvider.of(context)?.model.currentSpecies == i)
                  ? SystemColors.secondColor
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
                      color:
                          (HomePageProvider.of(context)?.model.currentSpecies ==
                                  i)
                              ? SystemColors.secondColor
                              : Colors.grey.shade400,
                    ),
                  ),
                  child: SvgPicture.asset(
                    listSpecies[i].icon,
                    color:
                        (HomePageProvider.of(context)?.model.currentSpecies ==
                                i)
                            ? SystemColors.secondColor
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
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: displaySize.height / 100 * 1.3,
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
        height: displaySize.height / 100 * 15,
        margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.6, color: SystemColors.secondColor),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(1, 4),
              blurRadius: 1,
            )
          ],
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
                    fontSize: 18,
                  ),
                ),
                const Text('Ish vaqti'),
                const Text('9:00-17:00'),
              ],
            ),
            Center(
              child: CircleAvatar(
                radius: displaySize.width / 100 * 10,
                backgroundImage: NetworkImage(doctor.image),
              ),
            ),
          ],
        ),
      );
    }

    Widget _species() {
      return SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: displaySize.height / 100 * 14.4,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => _speciesbuilder(index),
                scrollDirection: Axis.horizontal,
                itemCount: listSpecies.length,
              ),
            ),
          ],
        ),
      );
    }

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        _appBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: displaySize.height / 100 * 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sohalar',
                      style: TextStyle(
                        fontSize: displaySize.width / 100 * 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        _species(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: displaySize.height / 100 * 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shifokorlar',
                          style: TextStyle(
                            fontSize: displaySize.width / 100 * 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
            HomePageProvider.of(context)!
                .model
                .localListDoctors
                .map((e) => _doctor(e))
                .toList(),
          ),
        ),
      ],
    );
  }
}
