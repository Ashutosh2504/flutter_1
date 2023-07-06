import 'package:flutter/material.dart';
import 'package:flutter_1/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Ashutosh's";
    num temp = 32.5;
    var day = "Thursday";
    const pie = 3.14;

    return MaterialApp(
      home: HomePage(),
    );
  }
}
