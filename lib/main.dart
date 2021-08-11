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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _subscriptionFormKey = GlobalKey<FormState>();

  void _validate() {
    if (_subscriptionFormKey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _subscriptionFormKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (message) {
                    if (message == null || message.isEmpty) {
                      return 'Empty field';
                    }
                    return null;
                  },
                  maxLength: 300,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (message) {
                    if (message == null || message.isEmpty) {
                      return 'Empty field';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validate,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
