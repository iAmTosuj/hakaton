import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hakaton/app/bloc/model/services_model.dart';
import 'package:hakaton/app/data/dio_config.dart';

part 'services_cubit.freezed.dart';
part 'services_state.dart';

final servicesList = [
  ServicesModel(
      id: 0,
      name: 'Ремонт',
      description: 'Ремонт без головной боли',
      status: '',
      isHot: true),
  ServicesModel(
      id: 1,
      name: 'Аренда',
      description: 'Быстро подберём квартиру',
      status: '',
      isHot: true),
  ServicesModel(
      id: 2,
      name: 'Переезд',
      description: 'Ващи вещи в надёжных руках',
      status: '',
      isHot: true),
  ServicesModel(
      id: 3,
      name: 'Trade in',
      description: 'Новая квартира с выгодой',
      status: '',
      isHot: true),
  ServicesModel(
      id: 4,
      name: 'Мебель',
      description: 'Высокое качество по приемлемой цене',
      status: '',
      isHot: false),
  ServicesModel(
      id: 5,
      name: 'Кухня',
      description: 'Исполним все ваши капризы',
      status: '',
      isHot: false),
  ServicesModel(
      id: 6,
      name: 'Клининг',
      description: 'Моем как для себя',
      status: '',
      isHot: false),
  ServicesModel(
      id: 7,
      name: 'Двери',
      description: 'Множество видов всех типов',
      status: '',
      isHot: false),
  ServicesModel(
      id: 8,
      name: 'Сантехник',
      description: 'множество специалистов',
      status: '',
      isHot: false),
  ServicesModel(
      id: 9,
      name: 'Электрик',
      description: 'множество специалистов',
      status: '',
      isHot: false),
];

final List<List<Color>> gradients = [
  [
    Color(0xFF6300D7),
    Color(0xFF4888FD),
  ],
  [
    Color(0xFF6300D7),
    Color(0xFF4888FD),
  ],
  [
    Color(0xFF4888FD),
    Color(0xFF1C355A),
  ],
  [
    Color(0xFF6300D7),
    Color(0xFF1C355A),
  ],
];
final List<IconData> iconsServices = [
  Icons.home,
  Icons.family_restroom,
  Icons.margin,
  Icons.add_home_work,
  Icons.chair,
  Icons.cookie,
  Icons.cleaning_services,
  Icons.door_front_door,
  Icons.plumbing_outlined,
  Icons.electric_bolt,
];

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesState(servicesModel: []));

  Future<void> getServices() async {
    final response = await BaseNetwork.client.get('/services/claims/');

    emit(ServicesState(
        servicesModel: response.data
            .map<ServicesModel>((e) => ServicesModel.fromJson(e))
            .toList()));
  }

  Future<void> sendServices({
    required String name,
    required String description,
  }) async {
    emit(state.copyWith(isLoading: true));

    await BaseNetwork.client.post('/services/claims/', data: {
      'name': name,
      'description': description,
    });

    await getServices();
  }
}
