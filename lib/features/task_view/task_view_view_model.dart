import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasktimerconcept/features/add_task/models/task/task.dart';
import 'package:tasktimerconcept/features/task_view/bubbles.dart';
import 'package:tasktimerconcept/shared/services/task_service.dart';

class TaskViewViewModel extends ChangeNotifier {
  final TaskService _taskService;
  TaskViewViewModel(this._taskService);

  List<Bubble> bubbles = [];
  StreamSubscription _taskSub;
  Task task;
  Timer _timer;
  bool get isTimerActive => _timer?.isActive ?? false;

  void startStopTimer() {
    if (_timer != null) {
      if (_timer.isActive) {
        _timer.cancel();
        _timer = null;
        notifyListeners();
      }
    } else {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (task.duration.inSeconds == 0) {
          _timer.cancel();
          notifyListeners();
        }
        final updatedTask = task.copyWith(duration: Duration(seconds: task.duration.inSeconds - 1));
        debugPrint(updatedTask.duration.inMinutes.toString());
        updateTask(updatedTask);
      });
    }
  }

  // Call this with the timer
  void removeABubble() {
    if (bubbles.isNotEmpty) {
      bubbles.removeLast();
    }
  }

  // Call this with the timer
  Future<void> updateTask(Task task) async {
    final updatedTask = task.copyWith();
    await _taskService.updateTask(updatedTask);
  }

  void init(int id) {
    _taskSub = _taskService.task(id).listen((event) {
      task = event;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _taskSub?.cancel();
    _timer?.cancel();
  }
}
