import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmp_blog/home/model.dart';

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CounterModel counterModel = ref.watch(homeProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counterModel.count.toString(),
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      counterModel.plus();
                    },
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counterModel.minus();
                    },
                    child: Text("-"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
