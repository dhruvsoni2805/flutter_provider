import 'package:flutter/material.dart';

class FavouriateScreenProvider with ChangeNotifier {
  // final _carList = [
  //   'Jeep',
  //   'Ford',
  //   'Toyato',
  //   'Ram',
  //   'Honda',
  //   'Tesla',
  //   'Audi',
  //   'Nissan'
  // ];
  // List get carList => _carList;

  final _selectedItems = [];

  List get selectedItems => _selectedItems;

  void addItems(String value) {
    selectedItems.add(value);
    debugPrint(selectedItems.toString());
    notifyListeners();
  }

  void removeItems(String value) {
    selectedItems.remove(value);
    debugPrint(selectedItems.toString());
    notifyListeners();
  }
}
