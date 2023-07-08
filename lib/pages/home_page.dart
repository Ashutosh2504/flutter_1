import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_1/models/catalog.dart';
import 'package:flutter_1/widgets/drawer.dart';
import 'package:flutter_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Ashutosh";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    //rootBundle is used to get the JSON from files
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedCatalog = jsonDecode(catalogJson);
    var productsList = decodedCatalog["products"];
    CatalogModel.items = List.from(productsList)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final List dummyList = List.generate(6, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.deepPurple),
                        ),
                        child: Image.asset(
                          "assets/images/dr2.png",
                        ),
                        footer: Text(item.price.toString()),
                      ));
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
