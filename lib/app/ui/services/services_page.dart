import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/ui/services/services_card.dart';
import 'package:hakaton/app/util/text_theme.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Услуги',
                  style:
                      ResTextTheme.headline6.copyWith(color: ResColors.bgGray0),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 36,
                  child: TextField(
                    style: TextStyle(color: ResColors.bgGray0),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Color(0xFF1C355A),
                      hintText: 'поиск',
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      hintStyle: ResTextTheme.body1
                          .merge(const TextStyle(color: ResColors.textInfo)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: ResColors.textInfo,
                          width: 1,
                        ),
                      ),
                      prefixIcon: const Icon(
                        UiIcon.search,
                        color: ResColors.iconSecondary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    ServicesCard(
                      gradient: [
                        Color(0xFF6300D7),
                        Color(0xFF4888FD),
                      ],
                      title: 'Ремонт',
                      subtitle: 'Быстро и без заморочек',
                      icon: Icon(
                        UiIcon.book,
                        size: 40,
                        color: ResColors.bgGray60,
                      ),
                      isPrimary: true,
                    ),
                    ServicesCard(
                      gradient: [
                        Color(0xFF6300D7),
                        Color(0xFF4888FD),
                      ],
                      title: 'Ремонт',
                      subtitle: 'Быстро и без заморочек',
                      icon: Icon(
                        UiIcon.book,
                        size: 40,
                        color: ResColors.bgGray60,
                      ),
                    ),
                    ServicesCard(
                      gradient: [
                        Color(0xFF4888FD),
                        Color(0xFF1C355A),
                      ],
                      title: 'Ремонт',
                      subtitle: 'Быстро и без заморочек',
                      icon: Icon(
                        UiIcon.book,
                        size: 40,
                        color: ResColors.bgGray60,
                      ),
                    ),
                    ServicesCard(
                      gradient: [
                        Color(0xFF6300D7),
                        Color(0xFF1C355A),
                      ],
                      title: 'Ремонт',
                      subtitle: 'Быстро и без заморочек',
                      icon: Icon(
                        UiIcon.book,
                        size: 40,
                        color: ResColors.bgGray60,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
