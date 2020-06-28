// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TaskTearOff {
  const _$TaskTearOff();

  _Task call({int id, String name, Duration duration, Duration durationLeft}) {
    return _Task(
      id: id,
      name: name,
      duration: duration,
      durationLeft: durationLeft,
    );
  }
}

// ignore: unused_element
const $Task = _$TaskTearOff();

mixin _$Task {
  int get id;
  String get name;
  Duration get duration;
  Duration get durationLeft;

  $TaskCopyWith<Task> get copyWith;
}

abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call({int id, String name, Duration duration, Duration durationLeft});
}

class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object duration = freezed,
    Object durationLeft = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      duration: duration == freezed ? _value.duration : duration as Duration,
      durationLeft: durationLeft == freezed
          ? _value.durationLeft
          : durationLeft as Duration,
    ));
  }
}

abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, Duration duration, Duration durationLeft});
}

class __$TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(_Task _value, $Res Function(_Task) _then)
      : super(_value, (v) => _then(v as _Task));

  @override
  _Task get _value => super._value as _Task;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object duration = freezed,
    Object durationLeft = freezed,
  }) {
    return _then(_Task(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      duration: duration == freezed ? _value.duration : duration as Duration,
      durationLeft: durationLeft == freezed
          ? _value.durationLeft
          : durationLeft as Duration,
    ));
  }
}

class _$_Task extends _Task with DiagnosticableTreeMixin {
  const _$_Task({this.id, this.name, this.duration, this.durationLeft})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final Duration duration;
  @override
  final Duration durationLeft;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task(id: $id, name: $name, duration: $duration, durationLeft: $durationLeft)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Task'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('durationLeft', durationLeft));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Task &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.durationLeft, durationLeft) ||
                const DeepCollectionEquality()
                    .equals(other.durationLeft, durationLeft)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(durationLeft);

  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);
}

abstract class _Task extends Task {
  const _Task._() : super._();
  const factory _Task(
      {int id,
      String name,
      Duration duration,
      Duration durationLeft}) = _$_Task;

  @override
  int get id;
  @override
  String get name;
  @override
  Duration get duration;
  @override
  Duration get durationLeft;
  @override
  _$TaskCopyWith<_Task> get copyWith;
}
