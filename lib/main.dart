import 'package:first_flutter/presentation/news/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "News List",
        theme: ThemeData(primaryColor: Colors.blue),
        home: News()
    );
  }
}
