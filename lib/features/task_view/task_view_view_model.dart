import 'package:flutter/material.dart';
import 'package:tasktimerconcept/features/add_task/models/task/task.dart';
import 'package:tasktimerconcept/features/task_view/bubbles.dart';
import 'package:tasktimerconcept/shared/services/task_service.dart';

class TaskViewViewModel extends ChangeNotifier {
  final TaskService _taskService;
  TaskViewViewModel(this._taskService);

  List<Bubble> bubbles = [];

  void startTimer() {
    throw UnimplementedError();
  }

  void stopTimer() {
    throw UnimplementedError();
  }

  // Call this with the timer
  void removeABubble() {
    bubbles.removeLast();
  }

  // Call this with the timer
  Future<void> updateTask(Task task) async {
    final updatedTask = task.copyWith(duration: Duration(minutes: 5));
    await _taskService.updateTask(updatedTask);
  }

  Stream<Task> task(int id) => _taskService.task(id);
}
