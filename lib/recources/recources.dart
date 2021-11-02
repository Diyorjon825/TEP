import 'package:flutter/material.dart';

List<Species> listSpecies = [
  Species("Hammasi", 'assets/svg_icons/all.svg'),
  Species('Tish shofokori', 'assets/svg_icons/tooth.svg'),
  Species('Lor', 'assets/svg_icons/deaf.svg'),
  Species("Ko'z shofokori", 'assets/svg_icons/eye.svg'),
  Species('Tish shofokori', 'assets/svg_icons/tooth.svg'),
  Species('Lor', 'assets/svg_icons/deaf.svg'),
  Species("Ko'z shofokori", 'assets/svg_icons/eye.svg'),
];

class Species {
  String name, icon;
  Species(this.name, this.icon);
}
