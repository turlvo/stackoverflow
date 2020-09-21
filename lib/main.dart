import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'bottom_navbar.dart';

void main() {
  runApp(ChangeColor());
}

class ChangeColor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangeColorState();
  }
}

class _ChangeColorState extends State<ChangeColor> {
  List<Color> colorList = List(3);
  int selectedId = 0;
  void selectById(int id) {
    setState(() {
      selectedId = id;
    });
  }

  Widget myContainer(int id) {
    return InkWell(
      child: Container(
        width: 100,
        color: selectedId == id ? Colors.teal : Colors.red,
      ),
      onTap: () {
        selectById(id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return myContainer(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
