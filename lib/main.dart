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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
        body: NestedScrollView(
      body: Builder(
        builder: (context) {
          print(context);
          final _scr = PrimaryScrollController.of(context);
          return TabBarView(
            controller: _tabController,
            children: <Widget>[TabA(_scr), TabA(_scr)],
          );
        },
      ),
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: Text("Silver App"),
            pinned: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "Tab A",
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Tab B"),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                      ),
                    ],
                  ),
                ),
              ],
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ];
      },
    ));
  }
}

class TabA extends StatefulWidget {
  final ScrollController scrollController;

  TabA(this.scrollController);

  @override
  State<StatefulWidget> createState() => _TabAState();
}

class _TabAState extends State<TabA> with SingleTickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  bool isLoading = false;
  int page = 1;
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_scrollListener);
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 2.0))
        .animate(controller);
  }

  final data = [
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
    'T 0',
    'T 1',
    'T 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SlideTransition(
            position: offset,
            child: FloatingActionButton(
                elevation: 0.0,
                child: Icon(Icons.add, color: Colors.white),
                onPressed: () {})),
        body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child: _showData()));
  }

  void _scrollListener() async {
    if (widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {
      // display loading on bottom of listView
    }
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        controller.forward();
      });
    }
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        controller.reverse();
      });
    }
  }

  Widget _showData() {
    return Stack(
      children: <Widget>[
        _showListView(),
        // Align(
        //   child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Padding(
        //             padding: EdgeInsets.only(bottom: 15),
        //             child: Text("loading .....",
        //                 style: TextStyle(
        //                   color: const Color(0xff000066),
        //                   fontSize: 15,
        //                 ))),
        //         SizedBox(
        //           width: 12,
        //         ),
        //       ]),
        //   alignment: FractionalOffset.bottomCenter,
        // )
      ],
    );
  }

  Widget _showListView() {
    return ListView.builder(
        controller: widget.scrollController,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Text(data[index]);
        });
  }

  Future<void> _refresh() {
    // return data;
  }
}
