import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/ui/home/spec_action_card.dart';
import 'package:hakaton/app/util/text_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16),
          child: ListView(
            children: [
              Text(
                'AVA Prime',
                style: ResTextTheme.caption.copyWith(color: ResColors.bgGray0),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF393B40),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'В',
                      style: TextStyle(color: ResColors.bgGray0),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Владимир',
                    style: ResTextTheme.headline6
                        .copyWith(color: ResColors.bgGray0),
                  ),
                  Icon(
                    UiIcon.arrow_right,
                    color: ResColors.bgGray0,
                  ),
                ],
              ),
              SizedBox(
                height: 32,
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
                      hintText: 'услуги',
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      hintStyle: ResTextTheme.body1
                          .merge(const TextStyle(color: ResColors.textInfo)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.transparent,
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
                height: 16,
              ),
              Text(
                'Предложения для вас',
                style:
                    ResTextTheme.headline6.copyWith(color: ResColors.bgGray0),
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
                      gradientColor: [
                        Color(0xFF6300D7),
                        Color(0xFF4888FD),
                      ],
                      title: 'Ремонт без головной боли',
                      subtitle:
                          'Закажи ремонт под ключ и получи скидку на дизайн и меблировку',
                      buttonText: 'Заказать ремонт',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SpecActionCard(
                      gradientColor: [
                        Color(0xFF6300D7),
                        Color(0xFF1C355A),
                      ],
                      title: 'Переезд — это просто',
                      subtitle:
                          'Подготовим квартиру и перевезём ваши вещи в сохранности',
                      buttonText: 'Заказать переезд',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SpecActionCard(
                      gradientColor: [
                        Color(0xFF6300D7),
                        Color(0xFF4888FD),
                      ],
                      title: 'Аренда',
                      subtitle: 'Снять жильё, пока квартира готовится',
                      buttonText: 'Арендовать жильё',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Ближайшие события',
                style: ResTextTheme.body2.copyWith(color: ResColors.bgGray0),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                leading: Icon(
                  UiIcon.alarm,
                  size: 40,
                  color: ResColors.bgGray0,
                ),
                title: Text(
                  'назначена встреча',
                  style: ResTextTheme.body2.copyWith(
                      color: ResColors.bgGray0, fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  'Заявка на замену счётчиков',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
                ),
              ),
              ListTile(
                leading: Icon(
                  UiIcon.alarm,
                  size: 40,
                  color: ResColors.bgGray0,
                ),
                title: Text(
                  'назначена встреча',
                  style: ResTextTheme.body2.copyWith(
                      color: ResColors.bgGray0, fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  'Заявка на устранение недочётов',
                  style: ResTextTheme.body1.copyWith(color: ResColors.bgGray0),
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

class myHome extends StatelessWidget {
  const myHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
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
    );
  }
}
