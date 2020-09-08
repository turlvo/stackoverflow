import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
  bool _swapNutrients = false;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final petHeader = Container(
      alignment: Alignment.center,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: 'hero',
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Dog Name',
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                  Text(
                    'Age',
                    style: TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Text(
                'Daily Guide',
                style: TextStyle(fontSize: 32.0, color: Colors.black87),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );

    final macroCharts = Center(
      child: Text('macro chart here'),
    );

    final microCharts = Center(
      child: Text('micro chart here'),
    );

    Widget getMacroChart() {
      return Center(
        child: Text('macro chart here'),
      );
    }

    Widget getMicroChart() {
      return Center(
        child: Text('micro chart here'),
      );
    }

    final userSaveBtn = Container(
      margin: EdgeInsets.only(top: 2.0, bottom: 4.0),
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width,
      child: ToggleSwitch(
        cornerRadius: 4.0,
        minWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height,
        fontSize: 20.0,
        initialLabelIndex: _swapNutrients ? 0 : 1,
        activeBgColor: Color(0xFF03B898),
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey[300],
        inactiveFgColor: Colors.black54,
        labels: ['   Macro\nNutrients', '   Micro\nNutrients'],
        onToggle: (index) {
          print('switched to: $index');
          print('switched to: $_swapNutrients');
          setState(() {
            _swapNutrients = !_swapNutrients;
          });
        },
      ),
    );

    var swapTile = new Container(
      child: _swapNutrients ? macroCharts : microCharts,
    );

    final body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Welcome Alucard',
                  style: TextStyle(fontSize: 28.0, color: Colors.black87),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: userSaveBtn,
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: swapTile, //getCustomContainer(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final mainBody = Container(
      margin: EdgeInsets.only(
        top: 16.0,
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 12.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 1.0],
          colors: [
            Color(0xFF03B898),
            Color(0xFF01816B),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          // SizedBox(height: 32.0),
          Expanded(
            flex: 1,
            child: petHeader,
          ),
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: body,
            ),
          ),
          // lorem,
        ],
      ),
    );

    return Scaffold(
      body: mainBody, //_isShowingDialog ? bodyWithDialog : bodyWithCharts
    );
  }
}
