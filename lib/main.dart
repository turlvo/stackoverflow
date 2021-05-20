import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    print('${list.length}');
    return MaterialApp(
      home: ListView(
        key: UniqueKey(),
        children: list,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    new Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        list.add(Text('${list.length}', key: Key(list.length.toString())));
      });
    });
  }
}
