import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTileTheme(
        textColor: Colors.white,
        child: ListTile(
          title: Text(
            'Work on X',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          subtitle: Row(
            children: [
              Text('20 min'),
              SizedBox(width: 56),
              Text('3x'),
            ],
          ),
          trailing: IconButton(
            color: Colors.white,
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
