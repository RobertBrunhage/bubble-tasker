import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task.freezed.dart';

@freezed
abstract class Task implements _$Task {
  const Task._();
  const factory Task({int id, String name, Duration duration, int timesToDo}) = _Task;

  factory Task.fromMap(int id, Map<String, dynamic> json) {
    return Task(
      id: id,
      name: json['name'],
      duration: Duration(milliseconds: json['duration']),
      timesToDo: json['timesToDo'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name,
      "duration": duration.inMilliseconds,
      "timesToDo": timesToDo,
    };
  }
}
