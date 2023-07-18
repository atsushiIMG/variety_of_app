import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: TodoAddPage(),
    ),
  );
}

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 160,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: ((String value) {
                  setState(() {
                    _text = value;
                  });
                }),
              ),
              ElevatedButton(
                onPressed: _text.isEmpty ? null : () {},
                child: _text.isEmpty ? Text('Todoを決めよう') : Text('追加'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
