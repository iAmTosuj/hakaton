import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakaton/app/router/route_info.dart';
import 'package:hakaton/app/ui/auth/auth_page.dart';
import 'package:hakaton/app/ui/main/main_page.dart';
import 'package:hakaton/app/ui/splash/splash_page.dart';

class GoRouterSettings {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouteInfo.mainPage.path,
        name: RouteInfo.mainPage.name,
        builder: (context, state) => MainPage(
          index: int.tryParse(state.params['index']!)!,
        ),
      ),
      GoRoute(
        path: RouteInfo.splash.path,
        name: RouteInfo.splash.name,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: RouteInfo.auth.path,
        name: RouteInfo.auth.name,
        builder: (context, state) => AuthPage(),
      ),
    ],
    navigatorBuilder: (_, __, widget) {
      /// hack: scaffold нужен для отображения снекбара над bottomSheet.
      return Scaffold(
        body: widget,
      );
    },
    initialLocation: '/splash',
    debugLogDiagnostics: kDebugMode,
  );
}
