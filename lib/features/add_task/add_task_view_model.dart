import 'package:flutter/material.dart';
import 'package:tasktimerconcept/shared/services/task_service.dart';

import 'models/task/task.dart';

class AddTaskViewModel extends ChangeNotifier {
  final TaskService _taskService;
  AddTaskViewModel(this._taskService);

  final formKey = GlobalKey<FormState>();

  String name;
  Duration duration;

  Future<bool> saveForm() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      final task = Task(name: name, duration: duration, durationLeft: duration);

      try {
        await _taskService.addTask(task);
        formKey.currentState.reset();
        return true;
      } catch (e) {
        debugPrint("Something went wrong: $e");
      }
    }
    return false;
  }
}
