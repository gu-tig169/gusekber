import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(ToDoApp());

final barColor = const Color(0xFF99AAAB);
final bgColor = const Color(0xFFEAF0F1);
final textColor = const Color(0xFFE74292);

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO DO LIST',
      home: HomePage(),
    );
  }
}
