import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/router/route_info.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
import 'package:hakaton/app/util/text_theme.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String phone = '';
  String code = '';
  bool codeSend = false;
  final phoneController = TextEditingController()..text = '+7';
  final codeController = TextEditingController();

  @override
  void initState() {
    phoneController.addListener(() {
      setState(() {});
    });
    codeController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1C355A),
            const Color(0xFF213F7E),
          ],
          tileMode: TileMode.clamp,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Введите',
                style: ResTextTheme.headline6.copyWith(color: Colors.white),
              ),
              Text('номер телефона',
                  style: ResTextTheme.headline6.copyWith(color: Colors.white)),
              const SizedBox(
                height: 16,
              ),
              Text('Чтобы войти или вступить в клуб Acedia Prime',
                  style: ResTextTheme.subtitle1.copyWith(color: Colors.white)),
              const SizedBox(
                height: 40,
              ),
              TextField(
                style: const TextStyle(color: ResColors.bgGray0),
                controller: phoneController,
                enabled: !codeSend,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  fillColor: const Color(0xFF1C355A),
                  hintText: '+79999999999',
                  hintStyle: ResTextTheme.body1
                      .merge(const TextStyle(color: ResColors.textSecondary)),
                  border: const UnderlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF56CCF2))),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              if (codeSend)
                TextField(
                  style: const TextStyle(color: ResColors.bgGray0),
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: const Color(0xFF1C355A),
                    hintText: 'Код из смс',
                    hintStyle: ResTextTheme.body1
                        .merge(const TextStyle(color: ResColors.textSecondary)),
                    border: const UnderlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF56CCF2))),
                  ),
                ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (!codeSend) {
                      if (phoneController.text.length == 12) {
                        codeSend = true;
                        setState(() {});
                      }
                    } else {
                      if (codeController.text.length == 4) {
                        CustomNavigator.goNamed(
                          RouteInfo.welcome.name,
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF56CCF2),
                    onPrimary: const Color(0xFF1C355A),
                  ),
                  child: Text(
                    !codeSend ? 'Отправить смс' : 'подтвердить',
                    style: ResTextTheme.caption,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
