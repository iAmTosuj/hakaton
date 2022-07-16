import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/util/text_theme.dart';

class ServicesCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final List<Color> gradient;
  final bool isPrimary;

  const ServicesCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    this.isPrimary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 200,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPrimary)
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: ResColors.warning,
              ),
              child: Text(
                'популярно',
                style:
                    ResTextTheme.overline.copyWith(color: ResColors.bgWarning),
              ),
            ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: ResTextTheme.subtitle1.copyWith(color: ResColors.bgGray0),
          ),
          SizedBox(
            height: 8,
          ),
          Text(subtitle,
              style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: icon,
              )
            ],
          )
        ],
      ),
    );
  }
}
