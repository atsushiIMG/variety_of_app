import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmp_blog/home/model.dart';

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TimerModel timerModel = ref.watch(timerProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timerModel.seconds +
                    '.' +
                    timerModel.milliseconds +
                    '.' +
                    timerModel.microseconds,
                style: TextStyle(
                  fontSize: 56,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  timerModel.doExecute();
                },
                onLongPress: () {
                  timerModel.doCheat();
                },
                child: Text(timerModel.buttonContext.buttonDisplay),
                style: ElevatedButton.styleFrom(
                  foregroundColor: timerModel.buttonContext.foregroundColor,
                  backgroundColor: timerModel.buttonContext.backgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
