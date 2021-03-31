import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'providers/details_provider.dart';
import '../dependency_injection.dart' as di;
import '../model/country.dart';
import '../res/app_colors.dart';
import '../ui/details_page.dart';

class ListItem extends StatelessWidget {
  final Country country;

  ListItem({@required Key key, @required this.country}) : super(key: key);

  Color get _randomLightColor =>
      AppColors.lightColors[Random().nextInt(AppColors.lightColors.length)];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        enableFeedback: true,
        leading: CircleAvatar(
          backgroundColor: _randomLightColor,
          radius: 20,
          child: Text(
            country.code,
            style: TextStyle(
              color: AppColors.circleAvatarText,
            ),
          ),
        ),
        title: Text(
          country.name,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          country.capital,
          style: TextStyle(color: AppColors.secondaryText),
        ),
        trailing: Text(
          country.emoji,
          style: TextStyle(fontSize: 20),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => di.getIt<DetailsProvider>()..init(country),
              child: DetailsPage(),
            ),
          ),
        ),
      ),
    );
  }
}
