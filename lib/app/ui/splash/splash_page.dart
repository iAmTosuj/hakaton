import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/router/route_info.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
import 'package:hakaton/app/util/text_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        Duration(milliseconds: 700),
        // () => CustomNavigator.goNamed(
        //   RouteInfo.mainPage.name,
        //   params: RouteInfo.mainPage
        //       .getParams(extraParams: {'index': 0.toString()}),
        // ),
        () => CustomNavigator.goNamed(
          RouteInfo.auth.name,
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF1C355A),
            Color(0xFF213F7E),
          ],
          tileMode: TileMode.clamp,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SafeArea(
          child: Center(
            child: Text(
              'Acedia Prime',
              style: ResTextTheme.headline3.copyWith(
                color: ResColors.bgGray0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
