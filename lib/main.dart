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
  final ScrollController _scrollController = ScrollController();
  bool isEndOfList = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // you are at top position
          setState(() {
            isEndOfList = false;
          });
        } else {
          // you are at bottom position
          setState(() {
            isEndOfList = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isEndOfList
          ? FloatingActionButton(
              onPressed: () {
                _scrollController
                  ..animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
              },
              child: Icon(Icons.keyboard_arrow_up),
              backgroundColor: Colors.black,
            )
          : null,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 255,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 255,
                width: 380,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/PromotionLabel.png"),
                      fit: BoxFit.fill),
                ),
                child: Transform.translate(
                  offset: Offset(0, -60),
                  child: Image.asset(
                    "images/PromotionLabel.png",
                    width: 331,
                    height: 67,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  child: Text('1111'),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
