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
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.only(left: 16, right: 16),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            // height: 76,
            margin: EdgeInsets.only(bottom: 13),
            padding: EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.blue.withOpacity(0.23))
                ]),
            child: Row(
              children: <Widget>[
                Container(
                  height: 57,
                  width: 57,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/image_1.png"))),
                ),
                SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Text(
                    "testing123451 testing123451 testing123451 testing123451",
                  ),
                ),
              ],
            ),
          );
        });
  }
}
