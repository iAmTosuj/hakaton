import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_model.freezed.dart';
part 'services_model.g.dart';

@freezed
class ServicesModel with _$ServicesModel {
  factory ServicesModel({
    required int id,
    required String name,
    required String status,
    required String description,
    String? dt_work,
    @Default(false) bool isHot,
    String? image,
  }) = _ServicesModel;

  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);
}
