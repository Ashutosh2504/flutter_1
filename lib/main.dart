import 'package:flutter/material.dart';
import 'package:flutter_1/pages/home_page.dart';
import 'package:flutter_1/pages/login_page.dart';

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
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(primarySwatch: Colors.deepPurple),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // home: HomePage(),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage()
      },
    );
  }
}
