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

  int _currentIndex = 0;

  final tabs = [
    Center(child: Text("Home")),
    Center(child: Text("Chat")),
    Center(child: Text("Search")),
    Center(child: Text("Account"))
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 1));
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/images/dr2.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(item.name)
                    ],
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              label: "Chat",
              icon: Icon(Icons.chat),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              label: "Account",
              icon: Icon(Icons.person),
              backgroundColor: Colors.deepPurple),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
