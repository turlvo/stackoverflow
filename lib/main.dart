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

  List<Widget> bodyItems = [
    SizedBox(height: 50),
    Text(
      'NMR',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
      ),
    ),
    SizedBox(height: 50),
    Text(
      '+00 000 000 00 00',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
      ),
    ),
    SizedBox(height: 50),
    Text(
      'Text Text Text',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      child: LinearProgressIndicator(
        value: 50,
        semanticsLabel: 'Linear progress indicator',
      ),
    ),
    Text(
      'Text Text Text',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
      ),
    ),
    SizedBox(height: 50),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Text Text Text',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            'Text Text Text',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    SizedBox(height: 400),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            collapsedHeight: 250,
            stretch: true,
            backgroundColor: Color(0XFF7861AA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('Title'),
                Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 160.0,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return bodyItems[index];
              },
              childCount: bodyItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
