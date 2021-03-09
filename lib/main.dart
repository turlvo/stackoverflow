import 'package:flutter/gestures.dart';
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

  Widget _buildBody() {
    return Container(
      child: Center(
        child: new RichText(
          text: new TextSpan(
            children: [
              new TextSpan(
                text: 'Accept the ',
                style: new TextStyle(color: Colors.black),
              ),
              new TextSpan(
                text: 'Terms & Conditions',
                style: new TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Custom Dialog Demo",
                              ),
                              Text(
                                "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Yes",
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
