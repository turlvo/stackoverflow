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
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

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
        title: Text(widget.title ?? ''),
      ),
      body: Test(),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width - 140,
          height: 260,
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          return Colors.red[900];
                        }),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'tab',
                      )),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (states) {
                              return Colors.red[900];
                            }),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'tab',
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (states) {
                              return Colors.red[900];
                            }),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'tab',
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
