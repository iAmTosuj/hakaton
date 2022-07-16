import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakaton/app/bloc/model/services_model.dart';
import 'package:hakaton/app/bloc/services_cubit.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/ui/send_feeaback/send_feedback_page.dart';
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
            const SizedBox(
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
              leading: const Icon(
                UiIcon.edit,
                size: 40,
                color: ResColors.bgGray0,
              ),
              title: Text(
                'Решить проблему',
                style: ResTextTheme.body2.copyWith(
                    color: ResColors.bgGray0, fontWeight: FontWeight.w400),
              ),
              trailing: const Icon(
                UiIcon.arrow_right,
                color: ResColors.bgGray0,
              ),
              onTap: () => CustomNavigator.pushWidget(
                context: context,
                child: const SendFeedbackPage(
                  type: FeedType.problem,
                  name: 'Решить проблему',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                UiIcon.message_circle,
                size: 40,
                color: ResColors.bgGray0,
              ),
              title: Text(
                'Обратная связь',
                style: ResTextTheme.body2.copyWith(
                    color: ResColors.bgGray0, fontWeight: FontWeight.w400),
              ),
              onTap: () => CustomNavigator.pushWidget(
                context: context,
                child: const SendFeedbackPage(
                  type: FeedType.feet,
                  name: 'Обратная связь',
                ),
              ),
              trailing: const Icon(
                UiIcon.arrow_right,
                color: ResColors.bgGray0,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            BlocBuilder<ServicesCubit, ServicesState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.servicesModel.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Мои обращения',
                          style: ResTextTheme.subtitle1
                              .copyWith(color: ResColors.bgGray0),
                        ),
                      ),
                    ...state.servicesModel
                        .map<Widget>(
                          (e) => ListTile(
                            onTap: () => openDetail(context, e),
                            leading: Icon(
                              _getCurrentIcon(e.status),
                              color: ResColors.bgGray0,
                            ),
                            title: Text(
                              _getCurrentStatus(e.status),
                              style: ResTextTheme.caption.copyWith(
                                  color: ResColors.bgGray0,
                                  fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              'Заявка - ${e.name}',
                              style: ResTextTheme.body2
                                  .copyWith(color: ResColors.bgGray0),
                            ),
                            trailing: const Icon(
                              UiIcon.arrow_right,
                              color: ResColors.bgGray0,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void openDetail(
    BuildContext context,
    ServicesModel servicesModel,
  ) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        builder: (context) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1C355A),
                    Color(0xFF183052),
                  ],
                  tileMode: TileMode.clamp,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Обращение на тему: ${servicesModel.name}',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  servicesModel.description,
                  style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0),
                ),
              ],
            ),
          );
        });
  }

  _getCurrentStatus(String status) {
    switch (status) {
      case 'created':
        return 'На рассмотрении';
      case 'in_process':
        return 'В работе';
      case 'time_matching':
        return 'Согласование времени';
      case 'time_scheduled':
        return 'Время назначено';
      case 'finished':
        return 'Завершено';
    }
  }

  _getCurrentIcon(String status) {
    if (status == 'finished') {
      return UiIcon.check;
    }

    return UiIcon.player_play;
  }
}
