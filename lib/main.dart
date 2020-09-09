import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[200],
        body: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Wedding Organizer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                    Text(
                      'Pre-wedding, Photo, Party',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 25.5,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      child: Text('Our services',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 17,
                              color: Colors.white)),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Text('345 Moo 1 Tasud Chiang Rai, Thailand',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 17,
                      color: Colors.grey[300])),
            ],
          ),
        ),
      ),
    );
  }
}
