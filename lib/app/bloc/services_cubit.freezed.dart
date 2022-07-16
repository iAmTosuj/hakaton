// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'services_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServicesState {
  List<ServicesModel> get servicesModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res>;
  $Res call({List<ServicesModel> servicesModel, bool isLoading});
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

  final ServicesState _value;
  // ignore: unused_field
  final $Res Function(ServicesState) _then;

  @override
  $Res call({
    Object? servicesModel = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      servicesModel: servicesModel == freezed
          ? _value.servicesModel
          : servicesModel // ignore: cast_nullable_to_non_nullable
              as List<ServicesModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ServicesStateCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$$_ServicesStateCopyWith(
          _$_ServicesState value, $Res Function(_$_ServicesState) then) =
      __$$_ServicesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ServicesModel> servicesModel, bool isLoading});
}

/// @nodoc
class __$$_ServicesStateCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res>
    implements _$$_ServicesStateCopyWith<$Res> {
  __$$_ServicesStateCopyWithImpl(
      _$_ServicesState _value, $Res Function(_$_ServicesState) _then)
      : super(_value, (v) => _then(v as _$_ServicesState));

  @override
  _$_ServicesState get _value => super._value as _$_ServicesState;

  @override
  $Res call({
    Object? servicesModel = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_ServicesState(
      servicesModel: servicesModel == freezed
          ? _value._servicesModel
          : servicesModel // ignore: cast_nullable_to_non_nullable
              as List<ServicesModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ServicesState implements _ServicesState {
  _$_ServicesState(
      {required final List<ServicesModel> servicesModel,
      this.isLoading = false})
      : _servicesModel = servicesModel;

  final List<ServicesModel> _servicesModel;
  @override
  List<ServicesModel> get servicesModel {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servicesModel);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ServicesState(servicesModel: $servicesModel, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesState &&
            const DeepCollectionEquality()
                .equals(other._servicesModel, _servicesModel) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_servicesModel),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      __$$_ServicesStateCopyWithImpl<_$_ServicesState>(this, _$identity);
}

abstract class _ServicesState implements ServicesState {
  factory _ServicesState(
      {required final List<ServicesModel> servicesModel,
      final bool isLoading}) = _$_ServicesState;

  @override
  List<ServicesModel> get servicesModel;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
