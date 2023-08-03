import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmp_blog/home/model.dart';

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StopwatchModel stopwatchModel = ref.watch(stopwatchProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stopwatchModel.seconds +
                    "." +
                    stopwatchModel.milliseconds +
                    "." +
                    stopwatchModel.microseconds,
                style: GoogleFonts.kameron(
                  textStyle: TextStyle(
                    fontSize: 56.0,
                  ),
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  stopwatchModel.doExecute();
                },
                onLongPress: () {
                  stopwatchModel.doCheat();
                },
                child: Text(stopwatchModel.buttonContext.buttonDisplay),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "端末によってはマイクロ秒が正しく動作しない可能性があります。PC推奨",
                  style: TextStyle(fontSize: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
