import 'package:flutter/material.dart';
import 'package:projekt1/screens/first_screen.dart';
import 'sign_up_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppFF',
      home: FirstScreen(),
    );
  }
}
