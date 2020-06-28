import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasktimerconcept/features/add_task/add_task_view_model_provider.dart';
import 'package:tasktimerconcept/shared/widgets/custom_raised_button.dart';

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
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0xff3A3C5F),
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Write a name for your task';
                    }
                    return null;
                  },
                  onSaved: (name) => addTaskViewModel.name = name,
                ),
              ),
              SizedBox(height: 16),
              Stack(
                children: [
                  Positioned(
                    top: kIsWeb ? 110 : 65,
                    left: kIsWeb ? 86 : 40,
                    child: Text('$durationInMinutes minutes'),
                  ),
                  SingleCircularSlider(
                    // divisions
                    12,
                    // position
                    1,
                    height: kIsWeb ? 240 : 150,
                    width: kIsWeb ? 240 : 150,
                    // a = ?, b = position, c = ?
                    onSelectionChange: (a, b, c) {
                      calculateDurationFromPosition(b);
                      addTaskViewModel.duration = Duration(minutes: durationInMinutes);
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
                      child: CustomRaisedButton(
                        text: "Create",
                        onTap: () async {
                          final shouldPop = await addTaskViewModelProvider.read(context).saveForm();
                          if (shouldPop) {
                            Navigator.of(context).pop();
                          }
                        },
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
