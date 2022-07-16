import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/theme/custom_material_color.dart';
import 'package:hakaton/app/util/text_theme.dart';

final customTheme = ThemeData(
  primarySwatch: CustomMaterialColor.blue,
  scaffoldBackgroundColor: ResColors.bgGray0,
  appBarTheme: AppBarTheme(
    titleSpacing: 24,
    centerTitle: false,
    backgroundColor: ResColors.bgGray0,
    titleTextStyle: ResTextTheme.headline6.merge(
      const TextStyle(color: ResColors.text),
    ),
    iconTheme: const IconThemeData(
      color: ResColors.iconPrimary,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: ResColors.text,
    actionTextColor: ResColors.primary,
    contentTextStyle:
        ResTextTheme.body2.merge(const TextStyle(color: ResColors.bgGray0)),
    elevation: 6,
    behavior: SnackBarBehavior.floating,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: ResColors.bgGray0,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: ResColors.primary,
      textStyle: ResTextTheme.button,
    ),
  ),
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    headline1: ResTextTheme.headline1,
    headline2: ResTextTheme.headline2,
    headline3: ResTextTheme.headline3,
    headline4: ResTextTheme.headline4,
    headline5: ResTextTheme.headline5,
    headline6: ResTextTheme.headline6,

    /// для TextField в Material используется subtitle1, а у нас - body1
    // subtitle1: ResTextTheme.subtitle1,
    subtitle2: ResTextTheme.subtitle2,
    bodyText1: ResTextTheme.body1,
    bodyText2: ResTextTheme.body2,
    button: ResTextTheme.button,
    caption: ResTextTheme.caption,
    overline: ResTextTheme.overline,
  ).apply(
    bodyColor: ResColors.text,
    displayColor: ResColors.text,
  ),
  disabledColor: ResColors.disabled,
);
