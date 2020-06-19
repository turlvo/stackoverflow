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
  bool _scrollable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _isScrollable());
  }

  _isScrollable() {
    print(_scrollController.position.extentAfter > 0);
    _scrollable = _scrollController.position.extentAfter > 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 24),
            child: ListView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              children: <Widget>[
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
                Text('aaaindex'),
              ],
            ),
          ),
          if (_scrollable)
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.centerRight,
                    end: FractionalOffset.centerLeft,
                    colors: [Colors.green, Colors.yellow],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
