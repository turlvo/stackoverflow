import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      home: MyHomePage_1(),
    );
  }
}

class MyHomePage_1 extends StatefulWidget {
  @override
  _MyHomePage_1State createState() => _MyHomePage_1State();
}

class _MyHomePage_1State extends State<MyHomePage_1> {
  GlobalKey _globalKey = GlobalKey();
  var _bytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screenshot Example")),
      body: Column(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.teal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onLongPress: () async {
                          final render = (_globalKey.currentContext
                              .findRenderObject() as RenderRepaintBoundary);
                          final imageBytes = (await (await render.toImage())
                                  .toByteData(format: ImageByteFormat.png))
                              .buffer
                              .asUint8List();
                          setState(() {
                            _bytes = imageBytes;
                          });
                        },
                        child: RepaintBoundary(
                          key: _globalKey,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),

          /// display
          if (_bytes != null) Image.memory(_bytes, width: 250),
        ],
      ),
    );
  }
}
