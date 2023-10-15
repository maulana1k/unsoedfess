import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DBProvider extends ChangeNotifier {
  late Db _database;

  static final DBProvider _instance = DBProvider._();

  factory DBProvider() {
    return _instance;
  }

  DBProvider._();

  Future<void> initialize() async {
    const connectionString =
        'mongodb://localhost:27017/my_database'; // Replace with your MongoDB connection string
    _database = Db(connectionString);
    await _database.open();
  }

  Db get database => _database;
}
