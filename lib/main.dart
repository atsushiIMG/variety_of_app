import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "displayLarge",
                style: Theme.of(context).textTheme.displayLarge!.merge(
                      TextStyle(
                        color: Colors.amber,
                      ),
                    ),
              ),
              Text(
                "displayMedium",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "displaySmall",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "headlineLarge",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "headlineMedium",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "headlineSmall",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "titleLarge",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "titleMedium",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "titleSmall",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "bodyLarge",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "bodyMedium",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "bodySmall",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "labelLarge",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                "labelMedium",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                "labelSmall",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                      TextStyle(
                        color: Colors.amber,
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
