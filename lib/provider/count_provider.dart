import 'dart:async';

import 'package:flutter/foundation.dart';

class CountProivder with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void incrementCount() {
    _count++;
    debugPrint("Increment Count : $_count");
    notifyListeners();
  }

  void decrementCount() {
    _count--;
    debugPrint("Decrement Count : $_count");
    notifyListeners();
  }

  int _timerCount = 0;

  int get timerCount => _timerCount;

  void timerStart() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _timerCount++;
      debugPrint("Time Count is : ${timerCount.toString()}");
      notifyListeners();
    });
  }

  void timerCountReset() {
    _timerCount = 0;
  }

  double _slidervalue = 0.5;

  double get sliderValue => _slidervalue;

  void sliderChange(double value) {
    _slidervalue = value;
    notifyListeners();
  }

  bool _visible = true;

  bool get visible => _visible;

  void changeVisible() {
    _visible = !_visible;
    notifyListeners();
  }
}
