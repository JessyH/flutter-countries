import 'package:flutter/widgets.dart';

import '../extensions/string_ext.dart';

class Language {
  final String code;
  final String name;
  final String native;
  final bool rightToLeft;

  Language({
    @required this.code,
    @required String name,
    @required String native,
    @required this.rightToLeft,
  })  : this.name = name.dashIfNull(),
        this.native = native.dashIfNull();
}
