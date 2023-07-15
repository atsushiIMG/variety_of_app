import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = ChangeNotifierProvider((ref) => TimerModel());

class TimerModel extends ChangeNotifier {
  Timer? timer;
  Duration timerDuration = Duration(minutes: 1);
  String minutes = "00";
  String seconds = "00";

  bool isDisabledButton = false;
  String buttonDisplay = "start";
  Color foregroundColor = Color.fromARGB(255, 255, 199, 0);
  Color backgroundColor = Color.fromARGB(255, 253, 251, 240);

  TimerModel() {
    _refresh();
  }

  void _refresh() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    minutes = strDigits(timerDuration.inMinutes.remainder(60));
    seconds = strDigits(timerDuration.inSeconds.remainder(60));
    notifyListeners();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    final seconds = timerDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      timer!.cancel();
    } else {
      timerDuration = Duration(seconds: seconds);
    }
  }

  void start() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setCountDown();
      isDisabledButton = false;
      _refresh();
    });
  }

  void reset() {
    timer!.cancel();
    timerDuration = Duration(minutes: 1);
    isDisabledButton = false;
    _refresh();
  }

  void doStartOrReset() {
    // 連続して押下することを回避
    if (isDisabledButton) {
      return;
    }
    isDisabledButton = true;
    if (timerDuration == Duration(minutes: 1)) {
      start();
      buttonDisplay = "Reset";
      foregroundColor = Color.fromARGB(255, 113, 113, 113);
      backgroundColor = Color.fromARGB(255, 253, 251, 240);
    } else {
      reset();
      buttonDisplay = "Start";
      foregroundColor = Color.fromARGB(255, 255, 199, 0);
      backgroundColor = Color.fromARGB(255, 253, 251, 240);
    }
    notifyListeners();
  }
}
