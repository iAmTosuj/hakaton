import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakaton/app/bloc/services_cubit.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/router/route_info.dart';
import 'package:hakaton/app/ui/success_screen.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
import 'package:hakaton/app/util/text_theme.dart';

class WelcomeScreenPage extends StatefulWidget {
  const WelcomeScreenPage({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenPage> createState() => _WelcomeScreenPageState();
}

class _WelcomeScreenPageState extends State<WelcomeScreenPage> {
  var firstStep = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1C355A),
            Color(0xFF0F1E34),
          ],
          tileMode: TileMode.decal,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 200.0, bottom: 100),
          child: SafeArea(
            child: firstStep
                ? _FirstStep(
                    onTap: () => setState(() {
                      firstStep = false;
                    }),
                  )
                : _SecondStep(),
          ),
        ),
      ),
    );
  }
}

class _FirstStep extends StatelessWidget {
  final VoidCallback onTap;

  const _FirstStep({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Привет, Владимир!',
          textAlign: TextAlign.center,
          style: ResTextTheme.headline5.copyWith(color: ResColors.bgGray0),
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          'Спасибо, что выбрал Acedia Prime!',
          textAlign: TextAlign.center,
          style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Мы знаем, что ремонт и переезд — это сложно и стрессово, поэтому берём все заботы на себя.',
          textAlign: TextAlign.center,
          style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: const Color(0xFF1C355A),
            ),
            child: const Text(
              'Продолжить',
              style: ResTextTheme.caption,
            ),
          ),
        ),
      ],
    );
  }
}

class _SecondStep extends StatelessWidget {
  const _SecondStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ремонт без головной боли',
          style: ResTextTheme.headline5.copyWith(color: ResColors.bgGray0),
        ),
        SizedBox(
          height: 32,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Возьмём на себя',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '  -  дизайн',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
                Text(
                  '  -  расчёты',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
                Text(
                  '  -  материалы',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Гарантируем',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '  -  качество',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
                Text(
                  '  -  экономию',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
              ],
            ),
            SizedBox(
              width: 63,
            ),
            Icon(
              UiIcon.hand_shaking,
              size: 110,
              color: ResColors.bgGray0,
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => CustomNavigator.goNamed(
                  RouteInfo.mainPage.name,
                  params: RouteInfo.mainPage
                      .getParams(extraParams: {'index': 0.toString()}),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text(
                  'Пропустить',
                  style: ResTextTheme.caption,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  BlocProvider.of<ServicesCubit>(context).sendServices(
                    name: 'Лучший ремонт',
                    description: 'Свяжемся с вами в ближайшее время!',
                  );

                  CustomNavigator.pushWidget(
                      context: context,
                      child: SuccessScreen(
                        goHome: true,
                      ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: const Color(0xFF1C355A),
                ),
                child: const Text(
                  'Хочу ремонт!',
                  style: ResTextTheme.caption,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
