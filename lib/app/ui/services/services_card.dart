import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakaton/app/bloc/services_cubit.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/ui/success_screen.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
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
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: const BoxDecoration(
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
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    ResTextTheme.subtitle1.copyWith(color: ResColors.bgGray0),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: icon,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(subtitle,
              style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0)),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 25,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: const Color(0xFF1C355A),
              ),
              onPressed: () async {
                BlocProvider.of<ServicesCubit>(context).sendServices(
                  name: title,
                  description: 'Свяжемся с вами в ближайшее время!',
                );

                CustomNavigator.pushWidget(
                    context: context, child: const SuccessScreen());
              },
              child: const Text('Заказать'),
            ),
          )
        ],
      ),
    );
  }
}
