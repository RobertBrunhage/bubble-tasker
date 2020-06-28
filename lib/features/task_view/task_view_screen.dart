import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/add_task/models/task/task.dart';
import 'package:tasktimerconcept/features/task_view/task_view_view_model_provider.dart';
import 'package:tasktimerconcept/shared/widgets/custom_raised_button.dart';

import 'bubbles.dart';

class TaskViewScreen extends StatefulWidget {
  const TaskViewScreen({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _TaskViewScreenState createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {
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
                        topTitle(context),
                        Spacer(),
                        middleText(task, context),
                        Spacer(),
                        CustomRaisedButton(
                          onTap: viewmodel.removeABubble,
                          text: "Start",
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

  Text topTitle(BuildContext context) {
    return Text(
      "A bubble will pop \nevery minute",
      style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.center,
    );
  }

  RichText middleText(Task task, BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '${task.duration.inMinutes} ',
        style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: 'bubbles left',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
