import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hakaton/app/bloc/services_cubit.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/router/go_router_settings.dart';
import 'package:hakaton/app/theme/custom_theme.dart';

class PushNotification {
  static final plugin = FlutterLocalNotificationsPlugin();
  static final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    '123',
    '1233',
    importance: Importance.max,
    priority: Priority.high,
    channelDescription: '123123',
  );
  static final NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, macOS: null);

  await PushNotification.plugin.initialize(initializationSettings);

  runApp(App());
}

class App extends StatelessWidget {
  final _router = GoRouterSettings.router;

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServicesCubit>(
          create: (context) => ServicesCubit()..getServices(),
        )
      ],
      child: DefaultTextStyle(
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
      ),
    );
  }
}
