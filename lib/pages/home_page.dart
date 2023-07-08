import 'package:flutter/material.dart';
import 'package:flutter_1/models/catalog.dart';
import 'package:flutter_1/widgets/drawer.dart';
import 'package:flutter_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;

  final String name = "Ashutosh";

  @override
  Widget build(BuildContext context) {
    final List dummyList = List.generate(6, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
                key: Key("1"),
              );
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
