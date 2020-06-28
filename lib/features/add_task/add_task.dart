import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/add_task/add_task_view_model_provider.dart';

//todo: handle overflow problems on smaller screens
class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // default duration
  int durationInMinutes = 5;

  void calculateDurationFromPosition(int position) {
    switch (position) {
      case 1:
        setState(() => durationInMinutes = 5);
        break;
      case 2:
        setState(() => durationInMinutes = 10);
        break;
      case 3:
        setState(() => durationInMinutes = 15);
        break;
      case 4:
        setState(() => durationInMinutes = 20);
        break;
      case 5:
        setState(() => durationInMinutes = 25);
        break;
      case 6:
        setState(() => durationInMinutes = 30);
        break;
      case 7:
        setState(() => durationInMinutes = 35);
        break;
      case 8:
        setState(() => durationInMinutes = 40);
        break;
      case 9:
        setState(() => durationInMinutes = 45);
        break;
      case 10:
        setState(() => durationInMinutes = 50);
        break;
      case 11:
        setState(() => durationInMinutes = 55);
        break;
      case 12:
        setState(() => durationInMinutes = 60);
        break;
      default:
        setState(() => durationInMinutes = 5);
        break;
    }
  }

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
              SizedBox(height: 16),
              Stack(
                children: [
                  Positioned(
                    top: 94,
                    left: 40,
                    child: Text('Duration: $durationInMinutes minutes'),
                  ),
                  SingleCircularSlider(
                    // divisions
                    12,
                    // position
                    1,
                    // a = ?, b = position, c = ?
                    onSelectionChange: (a, b, c) {
                      calculateDurationFromPosition(b);
                      addTaskViewModel.duration =
                          Duration(minutes: durationInMinutes);
                    },
                  ),
                ],
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
                            Navigator.pop(context);
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
