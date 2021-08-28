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
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          show();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void show() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.only(top: 35),
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Alessandro Liparoti',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        '4 games palyed',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 38,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.flaticon.com/icons/png/512/147/147144.png'),
                      radius: 34,
                      backgroundColor: Colors.white),
                ),
              ),
            ],
          );
        });
  }
}
