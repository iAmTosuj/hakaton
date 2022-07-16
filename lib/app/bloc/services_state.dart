part of 'services_cubit.dart';

@freezed
class ServicesState with _$ServicesState {
  factory ServicesState(
      {required List<ServicesModel> servicesModel,
      @Default(false) bool isLoading}) = _ServicesState;
}
