import 'package:flutter/material.dart';
import 'dart:math' as math;

class CounterState extends ChangeNotifier {
  int counterValue = 0;

  void increment() {
    counterValue++;
    notifyListeners();
  }

  void random() {
    counterValue = math.Random().nextInt(20);
    notifyListeners();
  }

  void decrement() {
    counterValue--;
    notifyListeners();
  }
}
