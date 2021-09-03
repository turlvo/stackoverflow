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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Center(
          child: Text(
            'hello 你好',
            style: TextStyle(backgroundColor: Colors.red, fontSize: 24),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "hello",
                style: TextStyle(
                  fontSize: 24,
                ),
                strutStyle: StrutStyle(
                  height: 1.5,
                  fontSize: 24,
                ),
              ),
              color: Colors.red,
            ),
            Container(
              child: Text(
                "你好",
                style: TextStyle(
                  fontSize: 24,
                ),
                strutStyle: StrutStyle(
                  height: 1.5,
                  fontSize: 24,
                ),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
