// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServicesModel _$$_ServicesModelFromJson(Map<String, dynamic> json) =>
    _$_ServicesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      description: json['description'] as String,
      isHot: json['isHot'] as bool? ?? false,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ServicesModelToJson(_$_ServicesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'description': instance.description,
      'isHot': instance.isHot,
      'image': instance.image,
    };
