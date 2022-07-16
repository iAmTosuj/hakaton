import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/router/go_router_settings.dart';
import 'package:hakaton/app/theme/custom_theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final _router = GoRouterSettings.router;

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: ResColors.text),
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru', 'RU')],
        title: 'Ава груп',
        debugShowCheckedModeBanner: true,
        theme: customTheme,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      ),
    );
  }
}
