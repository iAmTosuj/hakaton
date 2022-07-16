import 'package:flutter/material.dart';
import 'package:hakaton/app/router/go_router_settings.dart';

/// Модуль для работы с навигацией
/// Создан, чтобы убрать зависимость кода в проекте от конкретной библиотеки для навигации
class CustomNavigator {
  static final _router = GoRouterSettings.router;

  static void pushWidget({
    required BuildContext context,
    required Widget child,
    bool fullscreenDialog = false,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => child,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  static void goNamed(
    name, {
    Map<String, String> params = const {},
  }) {
    _router.goNamed(
      name,
      params: params,
    );
  }
}
