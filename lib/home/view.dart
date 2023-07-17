import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SoundsModel soundsModel = ref.watch(soundsProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(soundsModel.display),
              ElevatedButton(
                onPressed: () {
                  soundsModel.playSoundInfinity();
                },
                child: Text("O N"),
              ),
              ElevatedButton(
                onPressed: () {
                  soundsModel.stopSound();
                },
                child: Text("OFF"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
