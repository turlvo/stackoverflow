import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
    return Login();
  }
}

class Login extends StatelessWidget {
  Widget _inputField(String title, Color border) {
    return TextField(
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: border),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
      ),
    );
  }

  Widget _buttons(name, BuildContext context) {
    return Center(
        child: ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ButtonTheme(
            minWidth: 200,
            child: RaisedButton(
              child: new Text(name),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(color: Colors.white),
              ),
              color: Colors.white,
              textColor: Colors.red,
              onPressed: () {},
            )),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text('logo'),
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 25, top: 50, right: 25),
                      child: _inputField('UserName', Colors.white),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 25, top: 10, right: 25),
                      child: _inputField('Password', Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: _buttons('Login', context),
                    ),
                  ],
                ))),
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Table(
                border: TableBorder(
                    top: BorderSide(color: Colors.white, width: 4),
                    verticalInside: BorderSide(color: Colors.white, width: 4),
                    horizontalInside:
                        BorderSide(color: Colors.white, width: 4)),
                children: [
                  TableRow(children: [
                    Icon(Icons.account_circle),
                    Icon(Icons.access_alarm)
                  ]),
                  TableRow(children: [
                    Icon(Icons.account_circle),
                    Icon(Icons.access_alarm)
                  ])
                ],
              ),
            )
          ],
        ));
  }
}
