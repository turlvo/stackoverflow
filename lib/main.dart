import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestArea(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TestArea(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TestArea extends StatefulWidget {
  @override
  _TestArea createState() => _TestArea();
}

class _TestArea extends State<TestArea> {
  List<List<bool>> boo = [
    [true, false, false],
    [true, false, false],
    [true, false, false],
    [true, false, false],
    [true, false, false],
    [true, false, false],
    [true, false, false],
    [true, false, false],
    [true, false, false],
    [true, false, false]
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(json.encode(boo)),
        child: Text('Save'),
      ),
      appBar: AppBar(
        title: Text('Add your pets'),
        actions: <Widget>[],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Text('$index'),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Icon(Icons.call),
                    Icon(Icons.cake),
                  ],
                  onPressed: (int itemIndex) {
                    setState(() {
                      boo[index][itemIndex] = !boo[index][itemIndex];
                    });
                  },
                  isSelected: boo[index],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
