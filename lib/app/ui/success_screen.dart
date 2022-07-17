import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/router/route_info.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
import 'package:hakaton/app/util/text_theme.dart';
import 'package:hakaton/generated/assets.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1C355A),
            Color(0xFF0F1E34),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                Assets.imagesFireworks,
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 64,
              ),
              Text(
                'Заказ оформлен!',
                style: ResTextTheme.headline6.copyWith(
                  color: ResColors.bgGray0,
                ),
              ),
              SizedBox(
                height: 64,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    CustomNavigator.goNamed(
                      RouteInfo.mainPage.name,
                      params: RouteInfo.mainPage
                          .getParams(extraParams: {'index': 0.toString()}),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: const Color(0xFF1C355A),
                  ),
                  child: Text(
                    'Отлично!',
                    style: ResTextTheme.caption,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
