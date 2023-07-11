import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = ChangeNotifierProvider((ref) => TimerModel());

class TimerModel extends ChangeNotifier {
  Timer? timer;
  Duration timerDuration = Duration(minutes: 1);
  String minutes = "00";
  String seconds = "00";

  TimerModel() {
    fetch();
  }

  void fetch() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    minutes = strDigits(timerDuration.inMinutes.remainder(60));
    seconds = strDigits(timerDuration.inSeconds.remainder(60));
    notifyListeners();
  }

  void start() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {});
  }

  void stop() {
    timer!.cancel();
  }
}
