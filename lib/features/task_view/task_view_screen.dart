import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/add_task/models/task/task.dart';
import 'package:tasktimerconcept/features/task_view/task_view_view_model_provider.dart';

import 'bubbles.dart';

class TaskViewScreen extends StatefulWidget {
  const TaskViewScreen({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _TaskViewScreenState createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {
  int amount = 100;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer((context, read) {
        final viewmodel = read(taskViewViewModelProvider);
        return StreamBuilder<Task>(
          stream: viewmodel.task(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final task = snapshot.data;
              return Stack(
                children: [
                  // Background with bubbles
                  Bubbles(amount: task.duration.inMinutes, color: Color(0xff7476A2), bubbles: viewmodel.bubbles),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 48),
                        Text("A bubble will pop every minute"),
                        Spacer(),
                        Text("${task.duration.inMinutes} bubbles left"),
                        Spacer(),
                        RaisedButton(
                          onPressed: () => viewmodel.removeABubble(),
                          child: Text("Start"),
                        ),
                        SizedBox(height: 48),
                      ],
                    ),
                  ),
                ],
              );
            }
            return SizedBox();
          },
        );
      }),
    );
  }
}
