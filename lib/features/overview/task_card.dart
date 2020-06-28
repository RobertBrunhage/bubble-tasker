import 'package:flutter/material.dart';
import 'package:tasktimerconcept/features/add_task/models/task/task.dart';
import 'package:tasktimerconcept/features/overview/overview_view_model_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/task_view/task_view_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key key, this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTileTheme(
        textColor: Colors.white,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TaskViewScreen(id: task.id),
              ),
            );
          },
          title: Text(
            '${task.name}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          subtitle: Row(
            children: [
              Text('${task.calculatedTime} min'),
            ],
          ),
          trailing: IconButton(
            color: Colors.white,
            icon: Icon(Icons.more_horiz),
            onPressed: () => overviewViewModelProvider.read(context).removeTask(task),
          ),
        ),
      ),
    );
  }
}
