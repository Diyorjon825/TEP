import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tep_app/network/get_from_internet.dart';

class Species {
  String name, icon;
  TypeDoctor type;
  Species(this.name, this.icon, this.type);
}

List<Species> listSpecies = [
  Species("Hammasi", 'assets/svg_icons/all.svg', TypeDoctor.All),
  Species(
      'Tish shofokori', 'assets/svg_icons/tooth.svg', TypeDoctor.TishDoctori),
  Species('Lor', 'assets/svg_icons/deaf.svg', TypeDoctor.Lor),
  Species("Ko'z shofokori", 'assets/svg_icons/eye.svg', TypeDoctor.KozDoctori),
  Species(
      'Tish shofokori', 'assets/svg_icons/tooth.svg', TypeDoctor.TishDoctori),
  Species('Lor', 'assets/svg_icons/deaf.svg', TypeDoctor.Lor),
  Species("Ko'z shofokori", 'assets/svg_icons/eye.svg', TypeDoctor.KozDoctori),
];

class Doctor {
  String name, image, surname, age;
  TypeDoctor type;
  Doctor(
      {required this.name,
      required this.surname,
      required this.age,
      required this.image,
      required this.type});
  factory Doctor.fromMap(Map<String, dynamic> map) {
    late TypeDoctor type;
    switch (map['type']) {
      case '0':
        {
          type = TypeDoctor.All;
          break;
        }
      case '1':
        {
          type = TypeDoctor.KozDoctori;
          break;
        }
      case '2':
        {
          type = TypeDoctor.Lor;
          break;
        }
      case '3':
        {
          type = TypeDoctor.TishDoctori;
          break;
        }
    }
    return Doctor(
        name: map['name'],
        surname: map['surname'],
        age: map['age'],
        image: map['image'],
        type: type);
  }
}

var listDoctors = <Doctor>[];

enum TypeDoctor { TishDoctori, Lor, KozDoctori, All }

class SystemColors {
  static var firstColor = Colors.teal.shade800;
  static var secondColor = Colors.deepOrange.shade800;
  static var therdColor = Colors.grey.shade200;
  static var navigationColor = Colors.teal.shade700;
}

class User {
  String name, surname, image;
  int age;
  User(this.name, this.surname, this.age, this.image);
}

var user1 = User('Yusufjon', 'Toshpulatov', 19, 'assets/images/avatar2.png');

Future<void> getInfo() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var list = await Api.getInfo();
  if (listDoctors.isEmpty) {
    for (var e in list) {
      listDoctors.add(Doctor.fromMap(e));
    }
  }
}
