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
      // backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(height: 300, child: Text('111asdf')),
          Container(height: 300, child: Text('asdf')),
          Container(height: 300, child: Text('2222asdf')),
          Container(height: 300, child: Text('asdf')),
          Text('asdf'),
          Text('asdf'),
          Text('asdf'),
          Text('asdf'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}
