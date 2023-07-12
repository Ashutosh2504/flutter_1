import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_1/pages/login_page.dart';

class MySpashScreen extends StatefulWidget {
  const MySpashScreen({super.key});

  @override
  State<MySpashScreen> createState() => _MySpashScreenState();
}

class _MySpashScreenState extends State<MySpashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          "assets/images/spashscreen.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
