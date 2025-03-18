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
      home: Scaffold(body: SafeArea(child: Center(child: Text('hi')))),
    );
  }
}
