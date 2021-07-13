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
    );
  }

  Widget _buildBody() {
    return CalendarUI();
  }
}

class CalendarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.now().toUtc();
    DateTime endDate = DateTime.utc(2021, 04, 10);
    // weekday value is Monday = 0, Tuesday = 1...Sunday = 6
    int weekday = DateTime.now().weekday - 1;

    getDaysInBetween() {
      final int difference = startDate.difference(endDate).inDays;
      print(difference);
      return difference;
    }

    final items = List<DateTime>.generate(getDaysInBetween(), (i) {
      DateTime date = endDate;

      return date.add(Duration(days: i));
    });

    var newList = items.reversed.toList();

    getDaysInBetween();

    return Row(
      children: [
        Expanded(
          child: Container(
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: items.length + weekday,
                itemBuilder: (BuildContext context, int key) {
                  if (key < weekday) {
                    return Card(
                      color: Colors.white,
                    );
                  } else {
                    int index = key - weekday;
                    print(key);
                    return Card(
                        color: Colors.amber,
                        child: Center(
                          child: Text('${newList[index].day} / index: $index'),
                        ));
                  }
                }),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: 350,
          ),
          child: Column(
            // crossAxisAlignment: ,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(flex: 1),
              Text('Mon'),
              Spacer(flex: 2),
              Text('Tue'),
              Spacer(flex: 2),
              Text('Wed'),
              Spacer(flex: 2),
              Text('Thu'),
              Spacer(flex: 2),
              Text('Fri'),
              Spacer(flex: 2),
              Text('Sat'),
              Spacer(flex: 2),
              Text('Sun'),
              Spacer(flex: 1),
            ],
          ),
        ),
      ],
    );
  }
}
