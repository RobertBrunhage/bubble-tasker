import 'package:flutter/material.dart';
import 'package:tasktimerconcept/bubble_app.dart';
import 'package:tasktimerconcept/shared/database/semblast_app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await SemblastAppDatabase().database;
  runApp(BubbleApp(db));
}
