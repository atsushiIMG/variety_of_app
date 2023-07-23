import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = ChangeNotifierProvider((ref) => TimerModel());

enum Status { start, stop, reset }

class TimerModel extends ChangeNotifier {
  late Timer _timer;
  final Stopwatch _stopwatch = Stopwatch();
  String seconds = "00";
  String milliseconds = "000";
  String microseconds = "000";
  Status nextState = Status.start;

  ButtonContext buttonContext = ButtonContext();

  TimerModel() {
    _refresh();
  }

  void _refresh() {
    String str2Digits(int n) => n.toString().padLeft(2, '0');
    String str3Digits(int n) => n.toString().padLeft(3, '0');
    seconds = str2Digits(_stopwatch.elapsed.inSeconds.remainder(60));
    milliseconds =
        str3Digits(_stopwatch.elapsed.inMilliseconds.remainder(1000));
    microseconds =
        str3Digits(_stopwatch.elapsed.inMicroseconds.remainder(1000));
    notifyListeners();
  }

  void _start() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 1), (_) {
      _refresh();
    });
    buttonContext.display(Status.start);
    nextState = Status.stop;
  }

  void _stop() {
    _stopwatch.stop();
    buttonContext.display(Status.stop);
    nextState = Status.reset;
  }

  void _reset() {
    _stopwatch.reset();
    _refresh();
    buttonContext.display(Status.reset);
    nextState = Status.start;
  }

  void doExecute() {
    // 連続して押下することを回避
    if (nextState == Status.start) {
      _start();
    } else if (nextState == Status.stop) {
      _stop();
    } else if (nextState == Status.reset) {
      _reset();
    }
    notifyListeners();
  }
}

class ButtonContext {
  String buttonDisplay = "Start";
  Color foregroundColor = const Color.fromARGB(255, 255, 199, 0);
  Color backgroundColor = const Color.fromARGB(255, 253, 251, 240);

  void display(Status state) {
    if (state == Status.start) {
      buttonDisplay = "Stop";
      foregroundColor = const Color.fromARGB(255, 255, 199, 0);
      backgroundColor = const Color.fromARGB(255, 253, 251, 240);
    } else if (state == Status.stop) {
      buttonDisplay = "Reset";
      foregroundColor = const Color.fromARGB(255, 113, 113, 113);
      backgroundColor = const Color.fromARGB(255, 253, 251, 240);
    } else if (state == Status.reset) {
      buttonDisplay = "Start";
      foregroundColor = const Color.fromARGB(255, 255, 199, 0);
      backgroundColor = const Color.fromARGB(255, 253, 251, 240);
    }
  }
}
