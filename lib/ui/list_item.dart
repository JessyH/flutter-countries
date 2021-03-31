import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/country.dart';
import '../res/app_colors.dart';

class ListItem extends StatelessWidget {
  final Country country;

  ListItem({@required Key key, @required this.country}) : super(key: key);

  Color get _randomLightColor =>
      AppColors.lightColors[Random().nextInt(AppColors.lightColors.length)];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        enableFeedback: true,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(14),
              child: CircleAvatar(
                backgroundColor: _randomLightColor,
                radius: 20,
                child: Text(
                  country.code,
                  style: TextStyle(
                    color: AppColors.circleAvatarText,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.text, fontSize: 16),
                    ),
                    Text(
                      country.capital,
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.emoji,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        onTap: () => print('${country.name} tapped!'),
      ),
    );
  }
}
