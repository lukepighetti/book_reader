import 'package:flutter/material.dart';
import 'screens/home/index.dart';
import 'package:flutter/services.dart' show SystemChrome;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.indigo[800],
      ),
      home: HomePage(),
    );
  }
}
