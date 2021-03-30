// @dart=2.9
// graphql_flutter doesn't (yet) support null safety

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependency_injection.dart' as di;
import 'providers/list_provider.dart';
import 'res/app_colors.dart';
import 'res/app_strings.dart';
import 'ui/list_page.dart';

void main() {
  di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.title,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: ChangeNotifierProvider(
        create: (_) => di.getIt<ListProvider>(),
        child: ListPage(),
      ),
    );
  }
}
