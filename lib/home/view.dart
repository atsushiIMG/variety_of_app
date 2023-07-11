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
        child: Text(
          timerModel.minutes + ':' + timerModel.seconds,
          style: TextStyle(
            fontSize: 56,
          ),
        ),
      ),
    );
  }
}
