import 'package:flutter/material.dart';
import 'package:flutter_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;

  final String name = "Ashutosh";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health App'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text('Welcome to $days days of flutter by $name'),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
