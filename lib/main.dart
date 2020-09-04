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

  width(context) {
    return 400;
  }

  height(context) {
    return 800;
  }

  Widget _buildBody() {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      "Home Page",
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.message,
                        color: Colors.grey[700],
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 5)
                  ],
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.teal,
                      unselectedLabelColor: Colors.grey[600],
                      tabs: [
                        Tab(icon: Icon(Icons.home)),
                        Tab(icon: Icon(Icons.people_outline)),
                        Tab(icon: Icon(Icons.account_balance)),
                        Tab(icon: Icon(Icons.notifications_active)),
                        Tab(icon: Icon(Icons.menu)),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: CircleAvatar(
                              radius: width(context) * 0.08,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              width: width(context) * 0.74,
                              height: width(context) * 0.15,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[800]),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'To ask a question \n type here...',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height(context) * 0.07,
                            width: width(context) * 0.70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[800]),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Container(
                          height: height(context) * 0.07,
                          width: width(context) * 0.25,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[800]),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                      child: Divider(
                        color: Colors.grey[600],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                      child: Card(
                        child: Container(
                          height: 200,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                      child: Card(
                        child: Container(
                          height: 200,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                      child: Card(
                        child: Container(
                          height: 200,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                      child: Card(
                        child: Container(
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
