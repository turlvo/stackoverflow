import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _started = false;
  bool _isDisappeared = false;
  Offset _position = Offset(10, 220);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 400,
              color: Colors.orange,
            ),
            Positioned(
              top: _position.dy - 30, // Size of widget to reposition correctly
              left: _position.dx,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _isDisappeared ? 0.0 : 1.0,
                child: Draggable(
                  child: Icon(Icons.home),
                  feedback: Icon(Icons.home),
                  onDragEnd: (details) {
                    print(details.offset);
                    setState(() {
                      if (!_started) _started = true;
                      _position = details.offset;

                      if (_position.dy - 30 > 400 || _position.dx > 300) {
                        setState(() {
                          _isDisappeared = true;
                        });
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedOpcaity {}
