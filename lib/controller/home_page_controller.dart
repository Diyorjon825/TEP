import 'package:flutter/material.dart';
import 'package:tep_app/network/get_from_internet.dart';
import 'package:tep_app/recources/recources.dart';

class HomePageModel extends ChangeNotifier {
  List<Doctor> localListDoctors = listDoctors;
  int selectedPage = 0;
  int currentSpecies = 0;

  void sortDoctorsWithButtons(int i) {
    //          sort doctors with buttons
    if (listSpecies[i].type == TypeDoctor.All) {
      localListDoctors = listDoctors;
    } else {
      localListDoctors = listDoctors
          .where((element) => listSpecies[i].type == element.type)
          .toList();
    }
    currentSpecies = i;
    notifyListeners();
  }

  void controllerListener(TextEditingController controllerText) {
    //        search function
    final text = controllerText.text;
    if (text.isNotEmpty) {
      localListDoctors = listDoctors
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      notifyListeners();
    } else {
      localListDoctors = listDoctors;
      notifyListeners();
    }
  }
}

class HomePageProvider extends InheritedNotifier<HomePageModel> {
  final HomePageModel model;
  const HomePageProvider({Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static HomePageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomePageProvider>();
  }

  @override
  bool updateShouldNotify(HomePageProvider oldWidget) {
    return model != oldWidget.model;
  }
}
