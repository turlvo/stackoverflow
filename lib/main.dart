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
  List<bool> clicked = [];
  var data = [
    1,
    2,
    3,
  ];
  @override
  void initState() {
    super.initState();
    clicked = List.filled(data.length, false);
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
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: const Color(0xffcccccc),
        indent: 10.0,
        endIndent: 10.0,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              child: RaisedButton(
                elevation: 0.0,
                color: Colors.white,
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffcccccc), width: 0.5),
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  clicked[index] = !clicked[index];
                  setState(() {});
                },
                child: Text(
                  data[index].toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            if (clicked[index]) ...[
              SizedBox(width: 10),
              Container(
                height: 60,
                width: 60,
                child: RaisedButton(
                  elevation: 0.0,
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffcccccc), width: 0.5),
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {},
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                child: RaisedButton(
                  elevation: 0.0,
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffcccccc), width: 0.5),
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {},
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 60,
                width: 60,
                child: RaisedButton(
                  elevation: 0.0,
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffcccccc), width: 0.5),
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {},
                  child: Text(
                    'T',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
