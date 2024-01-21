import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tasks/app/to_do_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupOrientation();
  runApp(const ToDoApp());
}

_setupOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
