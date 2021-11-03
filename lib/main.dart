import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as IMG;

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
      home: drag_full(),
    );
  }
}

class drag_full extends StatefulWidget {
  @override
  _drag_fullState createState() => _drag_fullState();
}

class _drag_fullState extends State<drag_full> {
  GlobalKey _globalKey = GlobalKey();
  GlobalKey _widget2Key = GlobalKey();
  var _bytes;
  bool selected = false;
  Offset offset = Offset(200, 400);

  bool isLocatedInWidget2 = false;

  Uint8List resizeImage(Uint8List data, int targetWidth, int targetHeight) {
    Uint8List resizedData = data;
    IMG.Image img = IMG.decodeImage(data);
    IMG.Image resized =
        IMG.copyResize(img, width: targetWidth, height: targetHeight);
    resizedData = IMG.encodeJpg(resized);
    return resizedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sample")),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
              child: Text(
                "Widget1",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            RepaintBoundary(
              key: _globalKey,
              child: Container(
                margin: EdgeInsets.all(100),
                width: 150,
                height: 150,
                color: Colors.black87,
              ),
            ),
            GestureDetector(
              onLongPress: () async {
                final render = (_globalKey.currentContext.findRenderObject()
                    as RenderRepaintBoundary);
                final imageBytes = (await (await render.toImage())
                        .toByteData(format: ImageByteFormat.png))
                    .buffer
                    .asUint8List();
                setState(() {
                  _bytes = imageBytes;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      key: _widget2Key,
                      width: 300,
                      height: 300,
                      color: Colors.orange,
                      child: Text(
                        "Widget2",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    if (_bytes != null)
                      if (isLocatedInWidget2)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    MemoryImage(resizeImage(_bytes, 300, 300)),
                              ),
                            ),
                          ),
                        ),

                    //   Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.yellow,
                    //       image: DecorationImage(
                    //         fit: BoxFit.fill,
                    //         image: Image.memory(
                    //           _bytes,
                    //         ).image,
                    //         //MemoryImage(_bytes),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            if (_bytes != null)
              if (!isLocatedInWidget2)
                Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      print(details);
                      offset = Offset(offset.dx + details.delta.dx,
                          offset.dy + details.delta.dy);

                      print('Image posiiton: ${offset.dx}, ${offset.dy}');
                      print(
                          'Image posiiton: ${details.localPosition.dx}, ${details.localPosition.dy}');
                      print(
                          'Image posiiton: ${details.globalPosition.dx}, ${details.globalPosition.dy}');
                      final RenderBox renderBox = _widget2Key.currentContext
                          ?.findRenderObject() as RenderBox;

                      final Size widget2Size =
                          renderBox.size; // or _widgetKey.currentContext?.size
                      final Offset widget2Offset =
                          renderBox.localToGlobal(Offset.zero);

                      print('Offset: ${widget2Offset.dx}, ${widget2Offset.dy}');
                      print(
                          'Position: ${(widget2Offset.dx + widget2Size.width) / 2}, ${(widget2Offset.dy + widget2Size.height) / 2}');

                      if ((widget2Offset.dx < details.globalPosition.dx &&
                              details.globalPosition.dx <
                                  (widget2Offset.dx + widget2Size.width)) &&
                          (widget2Offset.dy < details.globalPosition.dy &&
                              details.globalPosition.dy <
                                  (widget2Offset.dy + widget2Size.height))) {
                        if (isLocatedInWidget2 != true) {
                          print('****** in ******');
                          isLocatedInWidget2 = true;
                          offset = Offset(widget2Offset.dx, 0);
                        }
                      } else {
                        if (isLocatedInWidget2 != false) {
                          print('****** out ******');
                          isLocatedInWidget2 = false;
                        }
                      }
                      setState(() {});
                    },
                    child: Image.memory(
                      _bytes,
                      width: 200,
                      color: Colors.yellow,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
