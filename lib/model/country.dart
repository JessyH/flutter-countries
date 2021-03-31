import 'package:flutter/material.dart';

class Country {
  final String code;
  final String name;
  final String capital;
  final String emoji;

  Country({
    @required this.code,
    @required this.name,
    @required String capital,
    @required this.emoji,
  }) : this.capital = capital == null ? '-' : capital;
}
