import 'package:flutter/material.dart';

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
  String name, image;
  TypeDoctor type;
  Doctor(this.name, this.image, this.type);
}

var listDoctors = <Doctor>[
  Doctor('Akbar', 'assets/images/doctor1.jpg', TypeDoctor.KozDoctori),
  Doctor('Azimjon', 'assets/images/doctor2.jpg', TypeDoctor.Lor),
  Doctor('Madina', 'assets/images/doctor3.jpg', TypeDoctor.TishDoctori),
  Doctor('Akbar', 'assets/images/doctor1.jpg', TypeDoctor.KozDoctori),
  Doctor('Azimjon', 'assets/images/doctor2.jpg', TypeDoctor.Lor),
  Doctor('Madina', 'assets/images/doctor3.jpg', TypeDoctor.TishDoctori),
  Doctor('Akbar', 'assets/images/doctor1.jpg', TypeDoctor.KozDoctori),
  Doctor('Azimjon', 'assets/images/doctor2.jpg', TypeDoctor.Lor),
  Doctor('Madina', 'assets/images/doctor3.jpg', TypeDoctor.TishDoctori),
];

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

var user1 = User('Diyorjon', 'Nasriddinov', 19, 'assets/images/avatar2.png');
