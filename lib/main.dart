import 'package:flutter/material.dart';
// import 'package:unsoedfess/models/database.dart';
// import 'package:provider/provider.dart';
import 'unsoedfess_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final dbProvider = DBProvider();
  // await dbProvider.initialize();

  runApp(const UnsoedfessApp());
}
