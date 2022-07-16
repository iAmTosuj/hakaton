import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/ui/home/action_card.dart';
import 'package:hakaton/app/ui/home/spec_action_card.dart';
import 'package:hakaton/app/util/text_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Иванов Иван Иванович'),
        actions: [Icon(UiIcon.arrow_right)],
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8, top: 16),
          child: ListView(
            children: [
              Text(
                'Предложения для вас',
                style: ResTextTheme.headline6,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    SpecActionCard(
                      subtitle: 'Ремонт квартиры под ключ с скидкой ',
                      title: 'Только сегодня',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SpecActionCard(
                      subtitle: 'Наши грузчики сделают все за вас',
                      title: 'Поможем с перездом!',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SpecActionCard(
                      subtitle: 'Ремонт квартиры под ключ',
                      title: 'Заявка 423',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Мой дом',
                style: ResTextTheme.subtitle1,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('г. Краснодар ул. Красная д 21 кв 49'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('1-комн кв. 42 км/м 5/14 этаж'),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text('Статус: '),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: ResColors.bgSuccess,
                            ),
                            child: Text(
                              'дом сдан',
                              style: ResTextTheme.overline
                                  .copyWith(color: ResColors.success),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 35,
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Подробнее'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Активные заявки',
                style: ResTextTheme.subtitle1,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    ActionCard(
                      subtitle: 'Ремонт квартиры под ключ',
                      status: CardStatus.progress,
                      title: 'Заявка 423',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ActionCard(
                      subtitle: 'Подключение интернета',
                      status: CardStatus.progress,
                      title: 'Заявка 363',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
