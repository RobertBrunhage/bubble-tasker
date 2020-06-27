import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/overview/overview_view_model.dart';
import 'package:tasktimerconcept/shared/providers/task_service_provider.dart';

final overviewViewModelProvider = ChangeNotifierProvider<OverviewViewModel>((ref) {
  final taskService = ref.read(taskServiceProvider).value;
  return OverviewViewModel(taskService);
});
