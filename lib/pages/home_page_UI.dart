import 'package:flutter/material.dart';

import '../models/catalog.dart';

class MyHomePageUI extends StatefulWidget {
  const MyHomePageUI({super.key});

  @override
  State<MyHomePageUI> createState() => _MyHomePageUIState();
}

class _MyHomePageUIState extends State<MyHomePageUI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
              itemBuilder: (context, index) {
                final item = CatalogModel.items[index];
                Image img = Image.asset(item.image);
                return Card(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: img.image,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(item.name)
                    ],
                  ),
                );
              },
              itemCount: CatalogModel.items.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
