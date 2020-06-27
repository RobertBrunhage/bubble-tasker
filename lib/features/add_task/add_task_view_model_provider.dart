import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/add_task/add_task_view_model.dart';
import 'package:tasktimerconcept/shared/providers/task_service_provider.dart';

final addTaskViewModelProvider = ChangeNotifierProvider<AddTaskViewModel>((ref) {
  final taskService = ref.read(taskServiceProvider).value;
  return AddTaskViewModel(taskService);
});
