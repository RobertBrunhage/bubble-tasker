import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Timer Concept',
      theme: ThemeData(
        canvasColor: Color(0xff121231),
        cardColor: Color(0xff1B1D3C),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme.copyWith(
                button: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white),
                subtitle1: TextStyle(color: Colors.white),
                subtitle2: TextStyle(color: Colors.white),
                headline6: TextStyle(color: Colors.white),
                headline5: TextStyle(color: Colors.white),
                headline4: TextStyle(color: Colors.white),
                headline3: TextStyle(color: Colors.white),
                headline2: TextStyle(color: Colors.white),
                headline1: TextStyle(color: Colors.white),
              ),
        ),
      ),
      home: Overview(),
    );
  }
}

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
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
