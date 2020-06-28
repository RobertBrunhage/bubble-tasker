import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasktimerconcept/features/add_task/models/task/task.dart';
import 'package:tasktimerconcept/features/task_view/bubbles.dart';
import 'package:tasktimerconcept/shared/services/task_service.dart';

import 'audio_service.dart';

class TaskViewViewModel extends ChangeNotifier {
  final TaskService _taskService;
  final AudioService _audioService;
  TaskViewViewModel(this._taskService, this._audioService);

  List<Bubble> bubbles = [];
  StreamSubscription _taskSub;
  Task task;
  Timer _timer;
  bool get isTimerActive => _timer?.isActive ?? false;

  void startStopTimer() {
    if (_timer != null) {
      if (_timer.isActive) {
        _audioService.stopMusic();
        _timer.cancel();
        _timer = null;
        notifyListeners();
      }
    } else {
      _audioService.playMusic();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (task.durationLeft.inSeconds == 0) {
          _audioService.stopMusic();
          _timer.cancel();
          notifyListeners();
        } else {
          final updatedTask = task.copyWith(durationLeft: Duration(seconds: task.durationLeft.inSeconds - 1));
          if (updatedTask.calculatedTime != bubbles.length) {
            removeABubble();
          }
          print((task.duration.inSeconds - task.durationLeft.inSeconds) % 60);
          updateTask(updatedTask);
        }
      });
    }
  }

  // Call this with the timer
  void removeABubble() {
    if (bubbles.isNotEmpty) {
      bubbles.removeLast();
      notifyListeners();
    }
  }

  // Call this with the timer
  Future<void> updateTask(Task task) async {
    final updatedTask = task.copyWith();
    await _taskService.updateTask(updatedTask);
  }

  Future<void> resetTask() async {
    print(task.id);
    final resettedTask = task.copyWith(durationLeft: task.duration);
    await _taskService.updateTask(resettedTask);
    notifyListeners();
  }

  Future<void> removeTask() async {
    await _taskService.removeTask(task);
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
    _audioService?.stopMusic();
  }
}
