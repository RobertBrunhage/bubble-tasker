import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task.freezed.dart';

@freezed
abstract class Task implements _$Task {
  const Task._();
  const factory Task({int id, String name, Duration duration, Duration durationLeft}) = _Task;

  int get calculatedTime => (duration.inSeconds - durationLeft.inSeconds) % 60 != 0 ? durationLeft.inMinutes + 1 : durationLeft.inMinutes;

  factory Task.fromMap(int id, Map<String, dynamic> json) {
    return Task(
      id: id,
      name: json['name'],
      duration: Duration(milliseconds: json['duration']),
      durationLeft: Duration(milliseconds: json['durationLeft']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name,
      "duration": duration.inMilliseconds,
      "durationLeft": durationLeft.inMilliseconds,
    };
  }
}
