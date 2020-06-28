import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/add_task/add_task.dart';
import 'package:tasktimerconcept/features/add_task/models/task/task.dart';
import 'package:tasktimerconcept/features/overview/overview_view_model_provider.dart';

import 'task_card.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer((context, read) {
          final overviewViewModel = read(overviewViewModelProvider);
          return StreamBuilder<List<Task>>(
            stream: overviewViewModel.tasks,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final tasks = snapshot.data;
                if (tasks.isEmpty) {
                  return Center(
                    child: Text(
                      "Create a task 😊",
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: tasks.length,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: tasks[index],
                    );
                  },
                );
              }
              return SizedBox();
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff4654A3),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddTask(),
          ),
        ),
      ),
    );
  }
}
