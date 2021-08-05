import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    List strList = ['test', '\nhttps://google.com', '\ntest'];

    List<List<Widget>> rowsChildrens = [];
    List<Widget> rowChildren = [];
    for (var index = 0; index < strList.length; index++) {
      if (strList[index].startsWith('\n') && rowChildren.isNotEmpty) {
        rowsChildrens.add(rowChildren);
        rowChildren = [];
      }

      final String trimedStr = strList[index].trim();
      if (trimedStr.startsWith('http')) {
        rowChildren.add(
          InkWell(
            onTap: () {
              print(trimedStr);
            },
            child: Text(trimedStr),
          ),
        );
      } else {
        rowChildren.add(
          Text(trimedStr),
        );
      }
    }
    rowsChildrens.add(rowChildren);

    return Column(
      children: rowsChildrens
          .map<Widget>((rowChildren) => Row(children: rowChildren))
          .toList(),
    );
  }
}
