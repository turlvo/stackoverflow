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
    return SizedBox(
      width: 150,
      child: Stack(
        children: [
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              hintStyle: TextStyle(fontSize: 20),
              hintText: "Bugün",
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
