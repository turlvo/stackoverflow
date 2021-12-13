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
  FocusNode _focusNode = FocusNode();
  bool textEditHasFocus = false;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        textEditHasFocus = _focusNode.hasFocus;
      });
    });
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
      decoration: BoxDecoration(color: Colors.white),
      padding: new EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 20,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            child: TextField(
              focusNode: _focusNode,
              decoration: InputDecoration(
                // hintText: textEditHasFocus ? '' : 'Label',
                // hintStyle: TextStyle(
                //   color: Colors.grey,
                // ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(left: 40),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: textEditHasFocus ? 10 : 40,
            top: textEditHasFocus ? -10 : 13,
            child: InkWell(
              onTap: () {
                _focusNode.requestFocus();
              },
              child: Container(
                padding: EdgeInsets.only(left: 3),
                color: Colors.white,
                child: Text('Label'),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                color: Colors.transparent,
                child: Icon(Icons.favorite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
