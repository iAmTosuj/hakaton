import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/util/text_theme.dart';
import 'package:hakaton/generated/assets.dart';

class SpecActionCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const SpecActionCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ResColors.bgGray40,
              child: Image.asset(
                Assets.imagesRemont,
                fit: BoxFit.fill,
                height: 90,
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: ResTextTheme.subtitle2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(subtitle),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
              child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Заказать"))),
            )
          ],
        ),
      ),
    );
  }
}
