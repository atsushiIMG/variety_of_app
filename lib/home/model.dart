import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeModel());

class HomeModel extends ChangeNotifier {
  int count = 10;
  void plusCount() {
    count = count + 1;
    notifyListeners();
  }

  void minusCount() {
    count = count - 1;
    notifyListeners();
  }
}
