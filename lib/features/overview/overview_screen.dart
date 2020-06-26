import 'package:flutter/material.dart';
import 'package:tasktimerconcept/features/add_task/add_task.dart';

import 'task_card.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return TaskCard();
          },
        ),
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
