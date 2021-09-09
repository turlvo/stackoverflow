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
  ScrollController _scrollController = ScrollController();
  double hhhh = 30;
  String title = 'False';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      print("${_scrollController.position.maxScrollExtent}");
      // prints true if scrollable else false
      print(
          "isScrollable = ${_scrollController.position.maxScrollExtent != 0}");
      title = '${_scrollController.position.maxScrollExtent != 0}';
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (hhhh == 30) {
              hhhh = 3333;
            } else {
              hhhh = 30;
            }
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      controller: _scrollController,
      children: [
        Container(height: hhhh, child: Text('a')),
        Container(height: 30, child: Text('a')),
        Container(height: 30, child: Text('a')),
        Container(height: 30, child: Text('a')),
      ],
    );
  }
}
