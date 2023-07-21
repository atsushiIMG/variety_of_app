import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  onChanged: (String value) {
                    setState(() {
                      _text = value;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: _text.isEmpty ? null : () {},
                  child: _text.isEmpty ? Text("TODOを入力してね") : Text("追加する"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
