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
      body: Center(
        child: profileButton(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget profileButton() {
    return Container(
      width: 360,
      height: 60,
      child: SizedBox(
        child: FlatButton(
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  "System",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Text('icon'),
                  ),
                ),
              ),
              // Image.asset(
              //   "assets/system.png",
              //   height: 55,
              // )
            ],
          ),
          onPressed: () {},
          textColor: Colors.black,
          color: Colors.white,
          shape: OutlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, width: 2, color: Colors.black),
              borderRadius: new BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
