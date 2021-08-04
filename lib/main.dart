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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Red',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Slider(
                  value: 0.8,
                  inactiveColor: Colors.red,
                  activeColor: Colors.red,
                  onChanged: (value) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '202.0',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Green',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Slider(
                  value: 0.7,
                  inactiveColor: Colors.green,
                  activeColor: Colors.green,
                  onChanged: (value) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '160.0',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Blue',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Slider(
                  value: 0.6,
                  inactiveColor: Colors.blue,
                  activeColor: Colors.blue,
                  onChanged: (value) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '173.0',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
