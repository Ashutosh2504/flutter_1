import 'package:flutter/material.dart';
import 'package:flutter_1/pages/home_page.dart';
import 'package:flutter_1/pages/login_page.dart';
import 'package:flutter_1/pages/splash_screen.dart';
import 'package:flutter_1/util/routes.dart';
import 'package:flutter_1/widgets/themes.dart';

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

      debugShowCheckedModeBanner: false,

      darkTheme: MyTheme.darkTheme,

      theme: MyTheme.lightTheme,

      // home: HomePage(),
      home: MySpashScreen(),
      //initialRoute: MyRoutes.loginRoute,

      routes: {
        // "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.splashScreen: (context) => MySpashScreen(),
      },
    );
  }
}
