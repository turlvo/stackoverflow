import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
  String title = 'Default Title';
  Map<int, double> itemHeight = {};
  int currentHideIndex = -1;

  final _mainScrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _mainScrollController.addListener(_onMainScroll);
  }

  void _onMainScroll() {
    int justHiddenIndex =
        findIndexJustHidden(_mainScrollController.position.pixels);
    print('justHiddenIndex: $justHiddenIndex');
    if (currentHideIndex != justHiddenIndex) {
      setState(() {
        if (justHiddenIndex == -1) {
          title = 'Default Title';
        } else {
          title = 'Hidden Item index is $justHiddenIndex';
        }
      });
      currentHideIndex = justHiddenIndex;
    }
  }

  int findIndexJustHidden(currentPosition) {
    int index = -1;
    for (var item in itemHeight.entries) {
      if (currentPosition > item.value) {
        index = item.key;
      } else {
        if (index != 0) {
          return index;
        }
      }
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        controller: _mainScrollController,
        slivers: <Widget>[
          SliverAppBar(
            title: Text(title),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                double topPadding = index * 5.0;
                return WidgetSize(
                  onChange: (Size size) {
                    double beforeSumHeight =
                        index == 0 ? 0 : itemHeight[index - 1];
                    print({
                      'index': index,
                      'beforeSumHeight': beforeSumHeight,
                      'height': size.height
                    });
                    itemHeight[index] = beforeSumHeight + size.height;
                  },
                  child: AutoScrollTag(
                    key: ValueKey(index),
                    controller: AutoScrollController(),
                    index: index,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.5),
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0XFF000000).withOpacity(0.08),
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                          )),
                      padding: EdgeInsets.only(
                          top: 30.0 + topPadding, left: 20.0, right: 20.0),
                      child: Text('$index'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}

class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function onChange;

  const WidgetSize({
    Key key,
    @required this.onChange,
    @required this.child,
  }) : super(key: key);

  @override
  _WidgetSizeState createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }
}
