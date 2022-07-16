import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/util/text_theme.dart';

enum CardStatus {
  wait,
  progress,
  complete,
}

class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final CardStatus status;

  const ActionCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF6300D7)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              SizedBox(
                height: 16,
              ),
              Text(subtitle),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  getStatus(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getStatus() {
    switch (status) {
      case CardStatus.wait:
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: ResColors.bgSecondary,
          ),
          child: Text(
            'На рассмотрении',
            style: ResTextTheme.overline.copyWith(color: ResColors.secondary),
          ),
        );
      case CardStatus.progress:
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: ResColors.bgPrimary,
          ),
          child: Text(
            'В работе',
            style: ResTextTheme.overline.copyWith(color: ResColors.primary),
          ),
        );
      case CardStatus.complete:
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: ResColors.bgSuccess,
          ),
          child: Text(
            'Выполнено',
            style: ResTextTheme.overline.copyWith(color: ResColors.success),
          ),
        );
    }
  }
}
