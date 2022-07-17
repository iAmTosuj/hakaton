import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakaton/app/bloc/services_cubit.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/router/route_info.dart';
import 'package:hakaton/app/ui/home/spec_action_card.dart';
import 'package:hakaton/app/util/custom_navigator.dart';
import 'package:hakaton/app/util/text_theme.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16),
          child: RefreshIndicator(
            onRefresh: () async {
              await BlocProvider.of<ServicesCubit>(context).getServices();
            },
            child: ListView(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF393B40),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'В',
                        style: const TextStyle(color: ResColors.bgGray0),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Владимир',
                      style: ResTextTheme.headline6
                          .copyWith(color: ResColors.bgGray0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 36,
                    child: TextField(
                      style: const TextStyle(color: ResColors.bgGray0),
                      onTap: () => CustomNavigator.goNamed(
                        RouteInfo.mainPage.name,
                        params: RouteInfo.mainPage
                            .getParams(extraParams: {'index': 1.toString()}),
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: const Color(0xFF1C355A),
                        hintText: 'услуги',
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Предложения для вас',
                  style:
                      ResTextTheme.headline6.copyWith(color: ResColors.bgGray0),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const [
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
                const SizedBox(
                  height: 24,
                ),
                BlocBuilder<ServicesCubit, ServicesState>(
                  builder: (context, state) {
                    final filteredModel = state.servicesModel
                        .where((e) => e.status == 'time_scheduled');

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Предстоящие события',
                          style: ResTextTheme.body2
                              .copyWith(color: ResColors.bgGray0),
                        ),
                        if (!filteredModel.isEmpty)
                          ...filteredModel
                              .map<Widget>(
                                (e) => ListTile(
                                  leading: const Icon(
                                    UiIcon.alarm,
                                    size: 40,
                                    color: ResColors.bgGray0,
                                  ),
                                  title: Text(
                                    'назначена встреча: ${DateFormat('dd.MM, HH:mm').format(DateTime.parse(e.dt_work!))}',
                                    style: ResTextTheme.body2.copyWith(
                                        color: ResColors.bgGray0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  subtitle: Text(
                                    e.name,
                                    style: ResTextTheme.body1
                                        .copyWith(color: ResColors.bgGray0),
                                  ),
                                ),
                              )
                              .toList()
                        else
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Событий нет',
                              style: ResTextTheme.caption.copyWith(
                                  color: ResColors.bgGray0,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getCurrentStatus(String status) {
    switch (status) {
      case 'created':
        return 'На рассмотрении';
      case 'in_process':
        return 'В работе';
      case 'time_matching':
        return 'Согласование времени';
      case 'time_scheduled':
        return 'Время назначено';
      case 'finished':
        return 'Завершено';
    }
  }
}
