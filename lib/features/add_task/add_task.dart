import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/add_task/add_task_view_model_provider.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Text('Create your task'),
      ),
      body: Consumer((context, read) {
        final addTaskViewModel = read(addTaskViewModelProvider);

        return Form(
          key: addTaskViewModel.formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff3A3C5F),
                      border: InputBorder.none,
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    onSaved: (name) => addTaskViewModel.name = name,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff3A3C5F),
                      border: InputBorder.none,
                      hintText: 'Duration',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    // TODO: Change this to correct picker later
                    onSaved: (duration) => addTaskViewModel.duration = Duration(minutes: int.parse(duration)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff3A3C5F),
                      border: InputBorder.none,
                      hintText: 'Repeat',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    // TODO: Change this to correct picker later
                    onSaved: (timesToDo) => addTaskViewModel.timesToDo = int.parse(timesToDo),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          color: Color(0xff3A3C5F),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('Create'),
                          onPressed: () {
                            addTaskViewModelProvider.read(context).saveForm();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      }),
    );
  }
}
