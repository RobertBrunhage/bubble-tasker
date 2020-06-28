import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

class SemblastAppDatabase {
  Completer<Database> _dbOpenCompleter;

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();

      _openDatabase();
    }

    return _dbOpenCompleter.future;
  }

  Future<void> _openDatabase() async {
    var database;
    if (!kIsWeb) {
      final appDocumentDir = await getApplicationDocumentsDirectory();

      final dbPath = join(appDocumentDir.path, 'app.db');
      database = await databaseFactoryIo.openDatabase(dbPath);
    } else {
      var factory = databaseFactoryWeb;
      database = await factory.openDatabase('app.db');
    }

    _dbOpenCompleter.complete(database);
  }
}
