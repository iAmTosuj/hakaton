import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/ui/services_detail/services_detail_page.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
import 'package:hakaton/app/util/text_theme.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Поддержка',
                style:
                    ResTextTheme.subtitle1.copyWith(color: ResColors.bgGray0),
              ),
            ),
            ListTile(
              leading: Icon(
                UiIcon.edit,
                size: 40,
                color: ResColors.bgGray0,
              ),
              title: Text(
                'Решить проблему',
                style: ResTextTheme.body2.copyWith(
                    color: ResColors.bgGray0, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                UiIcon.arrow_right,
                color: ResColors.bgGray0,
              ),
              onTap: () => CustomNavigator.pushWidget(
                context: context,
                child: ServicesDetailPage(
                  type: FeedType.problem,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                UiIcon.message_circle,
                size: 40,
                color: ResColors.bgGray0,
              ),
              title: Text(
                'обратная связь',
                style: ResTextTheme.body2.copyWith(
                    color: ResColors.bgGray0, fontWeight: FontWeight.w400),
              ),
              onTap: () => CustomNavigator.pushWidget(
                context: context,
                child: ServicesDetailPage(
                  type: FeedType.feet,
                ),
              ),
              trailing: Icon(
                UiIcon.arrow_right,
                color: ResColors.bgGray0,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Мои обращения',
                style:
                    ResTextTheme.subtitle1.copyWith(color: ResColors.bgGray0),
              ),
            ),
            ListTile(
              leading: Icon(
                UiIcon.player_play,
                color: ResColors.bgGray0,
              ),
              title: Text(
                'Назначена встреча',
                style: ResTextTheme.caption.copyWith(
                    color: ResColors.bgGray0, fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                'Заявка на устранение недочётов',
                style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0),
              ),
              trailing: Icon(
                UiIcon.arrow_right,
                color: ResColors.bgGray0,
              ),
            ),
            ListTile(
              leading: Icon(
                UiIcon.player_play,
                color: ResColors.bgGray0,
              ),
              title: Text(
                'Назначена встреча',
                style: ResTextTheme.caption.copyWith(
                    color: ResColors.bgGray0, fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                'Заявка на устранение недочётов',
                style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0),
              ),
              trailing: Icon(
                UiIcon.arrow_right,
                color: ResColors.bgGray0,
              ),
            ),
            ListTile(
              leading: Icon(
                UiIcon.check,
                color: ResColors.bgGray0,
              ),
              title: Text(
                'Выполнено',
                style: ResTextTheme.caption.copyWith(
                    color: ResColors.bgGray0, fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                'Подключение интернета',
                style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0),
              ),
              trailing: Icon(
                UiIcon.arrow_right,
                color: ResColors.bgGray0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
