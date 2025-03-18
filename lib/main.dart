import 'package:bmi_calculator2/screens/Home_Screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Applications());
}

class Applications extends StatelessWidget {
  const Applications({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'dana'),
      home: HomeScreen(),
    );
  }
}
