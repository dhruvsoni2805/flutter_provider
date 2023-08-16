import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';
import 'favouirate_item_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List carList = [
    'Smartphone',
    'Laptop',
    'Headphones',
    'Smart Watch',
    'Camera',
    'Tablet',
    'Television',
    'Speaker',
    'Gaming Console',
    'Fitness Tracker',
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint("favouirate Screen Provider execute");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          "Favourite Screen",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          Consumer<FavouriateScreenProvider>(builder: (context, value, child) {
            return Badge(
              label: Text(value.selectedItems.length.toString()),
              offset: Offset.zero,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return FavouirateItemScreen();
                      },
                    ));
                  },
                  icon: const Icon(Icons.shopping_cart)),
            );
          }),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: carList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Consumer<FavouriateScreenProvider>(
                      builder: (context, value, child) {
                        return ListTile(
                            onTap: () {
                              if (value.selectedItems
                                  .contains(carList[index])) {
                                value.removeItems(carList[index]);
                              } else {
                                value.addItems(carList[index]);
                              }
                            },
                            leading: CircleAvatar(
                              child: Text((index + 1).toString()),
                            ),
                            title: Text(
                              "${carList[index]}",
                              style: const TextStyle(fontSize: 25),
                            ),
                            trailing: Icon(
                              Icons.favorite,
                              color:
                                  value.selectedItems.contains(carList[index])
                                      ? Colors.red
                                      : Colors.green,
                            ));
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
