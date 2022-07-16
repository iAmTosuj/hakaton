// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) {
  return _ServicesModel.fromJson(json);
}

/// @nodoc
mixin _$ServicesModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isHot => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicesModelCopyWith<ServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesModelCopyWith<$Res> {
  factory $ServicesModelCopyWith(
          ServicesModel value, $Res Function(ServicesModel) then) =
      _$ServicesModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String status,
      String description,
      bool isHot,
      String? image});
}

/// @nodoc
class _$ServicesModelCopyWithImpl<$Res>
    implements $ServicesModelCopyWith<$Res> {
  _$ServicesModelCopyWithImpl(this._value, this._then);

  final ServicesModel _value;
  // ignore: unused_field
  final $Res Function(ServicesModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? isHot = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isHot: isHot == freezed
          ? _value.isHot
          : isHot // ignore: cast_nullable_to_non_nullable
              as bool,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ServicesModelCopyWith<$Res>
    implements $ServicesModelCopyWith<$Res> {
  factory _$$_ServicesModelCopyWith(
          _$_ServicesModel value, $Res Function(_$_ServicesModel) then) =
      __$$_ServicesModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String status,
      String description,
      bool isHot,
      String? image});
}

/// @nodoc
class __$$_ServicesModelCopyWithImpl<$Res>
    extends _$ServicesModelCopyWithImpl<$Res>
    implements _$$_ServicesModelCopyWith<$Res> {
  __$$_ServicesModelCopyWithImpl(
      _$_ServicesModel _value, $Res Function(_$_ServicesModel) _then)
      : super(_value, (v) => _then(v as _$_ServicesModel));

  @override
  _$_ServicesModel get _value => super._value as _$_ServicesModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? isHot = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_ServicesModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isHot: isHot == freezed
          ? _value.isHot
          : isHot // ignore: cast_nullable_to_non_nullable
              as bool,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServicesModel implements _ServicesModel {
  _$_ServicesModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.description,
      this.isHot = false,
      this.image});

  factory _$_ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServicesModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String description;
  @override
  @JsonKey()
  final bool isHot;
  @override
  final String? image;

  @override
  String toString() {
    return 'ServicesModel(id: $id, name: $name, status: $status, description: $description, isHot: $isHot, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.isHot, isHot) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isHot),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_ServicesModelCopyWith<_$_ServicesModel> get copyWith =>
      __$$_ServicesModelCopyWithImpl<_$_ServicesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServicesModelToJson(
      this,
    );
  }
}

abstract class _ServicesModel implements ServicesModel {
  factory _ServicesModel(
      {required final int id,
      required final String name,
      required final String status,
      required final String description,
      final bool isHot,
      final String? image}) = _$_ServicesModel;

  factory _ServicesModel.fromJson(Map<String, dynamic> json) =
      _$_ServicesModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get status;
  @override
  String get description;
  @override
  bool get isHot;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesModelCopyWith<_$_ServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
