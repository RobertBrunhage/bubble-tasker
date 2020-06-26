import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff3A3C5F),
                  border: InputBorder.none,
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff3A3C5F),
                  border: InputBorder.none,
                  hintText: 'Duration',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff3A3C5F),
                  border: InputBorder.none,
                  hintText: 'Repeat',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
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
                      onPressed: () {},
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
  }
}
