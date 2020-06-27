import 'package:flutter/material.dart';
import 'package:tasktimerconcept/features/add_task/models/task/task.dart';
import 'package:tasktimerconcept/shared/services/task_service.dart';

class OverviewViewModel extends ChangeNotifier {
  final TaskService _taskService;
  OverviewViewModel(this._taskService);

  Stream<List<Task>> get tasks => _taskService.tasks();

  Future<void> removeTask(Task task) async {
    await _taskService.removeTask(task);
  }
}
