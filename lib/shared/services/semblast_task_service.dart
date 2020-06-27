import 'package:sembast/sembast.dart';

import '../../features/add_task/models/task/task.dart';
import 'task_service.dart';

class SemblastTaskService implements TaskService {
  static const String TASK_STORE_NAME = 'tasks';

  final _taskStore = intMapStoreFactory.store('tasks');

  Database _db;
  SemblastTaskService(this._db);

  @override
  Future<void> addTask(Task task) async {
    await _taskStore.add(_db, task.toJson());
  }

  @override
  Future<void> removeTask(Task task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    await _taskStore.delete(_db, finder: finder);
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  Stream<List<Task>> tasks() {
    return _taskStore
        .query(finder: Finder(sortOrders: [SortOrder('id')]))
        .onSnapshots(_db)
        .map((event) => event.map((e) => Task.fromMap(e.key, e.value)).toList());
  }
}
