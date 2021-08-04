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
  String text =
      'Cza Czo Czi Cze Czy Czu Czą Czę Czó\nacz ocz icz ecz ycz ucz ącz ęcz ócz\n\nSza Szo Szi Sze Szy Szu Szą Szę Szó\nasz osz isz esz ysz usz ąsz ęsz ósz\n\nDza Dzo Dzi Dze Dzy Dzu Dzą Dzę Dzó\nadz odz idz edz ydz udz ądz ędz ódz';
  List<String> stringList;
  @override
  void initState() {
    super.initState();
    stringList = text.split("\n");
    stringList.forEach((e) => print(e));
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
      color: Colors.yellow[800],
      height: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: stringList.length,
        itemBuilder: (context, i) => Text(
          stringList[i],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
