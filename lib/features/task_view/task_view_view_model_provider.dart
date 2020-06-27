import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/task_view/task_view_view_model.dart';
import 'package:tasktimerconcept/shared/providers/task_service_provider.dart';

final taskViewViewModelProvider = ChangeNotifierProvider<TaskViewViewModel>((ref) {
  final taskService = ref.read(taskServiceProvider).value;
  return TaskViewViewModel(taskService);
});
