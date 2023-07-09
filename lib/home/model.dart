import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final homeProvider = ChangeNotifierProvider((ref) => CounterModel());

class CounterModel extends ChangeNotifier {
  int count = 10;
  void plus() {
    count = count + 1;
    notifyListeners();
  }

  void minus() {
    count = count - 1;
    notifyListeners();
  }
}
