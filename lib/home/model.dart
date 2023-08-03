import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopwatchProvider = ChangeNotifierProvider((ref) => StopwatchModel());

enum Status { start, stop, reset }

class StopwatchModel extends ChangeNotifier {
  Stopwatch _stopwatch = Stopwatch();
  String seconds = "00";
  String milliseconds = "000";
  String microseconds = "000";
  Status nextState = Status.start;

  ButtonContext buttonContext = ButtonContext();

  void _refresh() {
    String str2Digits(int n) => n.toString().padLeft(2, "0");
    String str3Digits(int n) => n.toString().padLeft(3, "0");
    seconds = str2Digits(_stopwatch.elapsed.inSeconds.remainder(60));
    milliseconds =
        str3Digits(_stopwatch.elapsed.inMilliseconds.remainder(1000));
    microseconds =
        str3Digits(_stopwatch.elapsed.inMicroseconds.remainder(1000));
    notifyListeners();
  }

  StopwatchModel() {
    _refresh();
  }

  void doExecute() {
    if (nextState == Status.start) {
      _start();
    } else if (nextState == Status.stop) {
      _stop();
    } else if (nextState == Status.reset) {
      _reset();
    }
  }

  void doCheat() {
    _stopwatch.start();
    Timer.periodic(const Duration(milliseconds: 1), (_) {
      _refresh();
      if (_stopwatch.elapsed.inSeconds == 3) {
        _stop();
        _magic();
      }
    });
    buttonContext.display(Status.start);
    nextState = Status.stop;
  }

  void _magic() {
    String str3Digits(int n) => n.toString().padLeft(3, "0");
    seconds = str3Digits(3);
    milliseconds = str3Digits(0);
    microseconds = str3Digits(0);
    notifyListeners();
  }

  void _start() {
    _stopwatch.start();
    Timer.periodic(const Duration(milliseconds: 1), (_) {
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
    buttonContext.display(Status.reset);
    nextState = Status.start;
  }
}

class ButtonContext {
  String buttonDisplay = "start";

  void display(Status status) {
    if (status == Status.start) {
      buttonDisplay = "stop";
    } else if (status == Status.stop) {
      buttonDisplay = "reset";
    } else if (status == Status.reset) {
      buttonDisplay = "start";
    }
  }
}
