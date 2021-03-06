import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakaton/app/bloc/services_cubit.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/ui/success_screen.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
import 'package:hakaton/app/util/text_theme.dart';

class SpecActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final List<Color> gradientColor;

  const SpecActionCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.gradientColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF4888FD)),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            colors: gradientColor,
            tileMode: TileMode.decal,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Text(
                subtitle,
                style: ResTextTheme.caption.copyWith(color: ResColors.bgGray0),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
              child: SizedBox(
                height: 30,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ServicesCubit>(context).sendServices(
                      name: title,
                      description: '???????????????? ?? ???????? ?? ?????????????????? ??????????!',
                    );

                    CustomNavigator.pushWidget(
                        context: context, child: const SuccessScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Color(0xFF1C355A),
                  ),
                  child: Text(
                    buttonText,
                    style: ResTextTheme.caption,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
