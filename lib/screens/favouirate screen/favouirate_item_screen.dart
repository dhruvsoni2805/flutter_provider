import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class FavouirateItemScreen extends StatefulWidget {
  const FavouirateItemScreen({super.key});

  @override
  State<FavouirateItemScreen> createState() => _FavouirateItemScreenState();
}

class _FavouirateItemScreenState extends State<FavouirateItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouirateProvider = Provider.of<FavouriateScreenProvider>(context);
    debugPrint("print");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favouirate Item Screen"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView.builder(
          itemCount: favouirateProvider.selectedItems.length,
          itemBuilder: (context, index) {
            return Consumer<FavouriateScreenProvider>(
              builder: (context, value, child) {
                return Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(
                      value.selectedItems[index],
                      style: const TextStyle(fontSize: 25),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          value.removeItems(value.selectedItems[index]);
                        },
                        icon: const Icon(Icons.delete)),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
