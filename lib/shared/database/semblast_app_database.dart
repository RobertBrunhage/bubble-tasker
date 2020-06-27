import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

import 'package:sembast/sembast.dart';

class SemblastAppDatabase {
  static final SemblastAppDatabase _singleton = SemblastAppDatabase._();

  static SemblastAppDatabase get instance => _singleton;

  Completer<Database> _dbOpenCompleter;

  SemblastAppDatabase._();

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();

      _openDatabase();
    }

    return _dbOpenCompleter.future;
  }

  Future<void> _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    final dbPath = join(appDocumentDir.path, 'app.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter.complete(database);
  }
}
