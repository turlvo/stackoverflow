import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      theme: new ThemeData(primarySwatch: Colors.amber),
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double rightValue = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Title",
      theme: new ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        body: SafeArea(
          child: Animator(
              tween: Tween<double>(
                  begin: 0.0, end: MediaQuery.of(context).size.width),
              repeats: 0,
              duration: const Duration(milliseconds: 1000),
              builder: (context, animatorState, child) {
                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/bg.png',
                          ),
                        ),
                      ),
                      height: 200.0,
                    ),
                    Positioned(
                      // left: 0,
                      left: 70 + animatorState.value,
                      child: Center(
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                        ),
                      ),
                    ),
                    Positioned(
                      // left: 0,
                      left: animatorState.value,
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Color(0xFF45ced5), Colors.transparent],
                            ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Container(
                            color: Color(0xFF45ced5),
                            width: 70.0,
                            height: 200.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
