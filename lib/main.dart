import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

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
      body: FutureBuilder(
          future: getUint8ListFromImage(
              'https://www.svgrepo.com/show/19461/url-link.svg'),
          builder: (context, snapshot) {
            print(snapshot);
            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Uint8List> getUint8ListFromImage(imgUrl) async {
    //Get the image from the URL and then convert it to Uint8List
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
        .buffer
        .asUint8List();

    print(bytes);

    return bytes;
  }
}
