import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

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
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _currentIndex = 0;
  PageController _pageController;
  List<Widget> _pages = [];

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
  ];

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    _pages = [PageA(), PageB()];

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('example')),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 2,
        activeIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Color(0XFFFFA400) : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Page $index",
                  maxLines: 1,
                  style: TextStyle(color: color),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA>
    with AutomaticKeepAliveClientMixin<PageA> {
  bool shouldKeepAlive = true;
  String input;
  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        if (!visible) {
          FocusManager.instance.primaryFocus.unfocus();
          print('keyboard disappeared');
          if (!shouldKeepAlive && input.isEmpty) {
            shouldKeepAlive = true;
            updateKeepAlive();
          } else if (shouldKeepAlive && input.isNotEmpty) {
            shouldKeepAlive = false;
            updateKeepAlive();
          }
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => shouldKeepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('PageA is builded');

    return TextField(
      onSubmitted: (String value) {
        print('onSumitted: $value');
      },
      onChanged: (String value) {
        input = value;
        print('onChanged: $value');
      },
    );
  }
}

class PageB extends StatefulWidget {
  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('PageB is builded');
    return TextField();
  }
}
