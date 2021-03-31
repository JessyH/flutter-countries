import 'package:flutter/widgets.dart';

import 'continent.dart';
import 'language.dart';
import '../extensions/string_ext.dart';

class Country {
  final String code;
  final String name;
  final String native;
  final String phone;
  final String capital;
  final String currency;
  final String emoji;
  final List<Language> languages = [];
  final Continent continent;

  Country({
    @required this.code,
    @required this.name,
    @required this.native,
    @required this.phone,
    @required String capital,
    @required String currency,
    @required this.emoji,
    @required this.continent,
    @required List<Language> languages,
  })  : this.capital = capital.dashIfNull(),
        this.currency = currency.dashIfNull() {
    this.languages.addAll(languages);
  }

  Country.light(
      {@required this.code,
      @required this.name,
      @required String capital,
      @required this.emoji})
      : this.capital = capital.dashIfNull(),
        this.native = null,
        this.phone = null,
        this.currency = null,
        this.continent = null;
}
