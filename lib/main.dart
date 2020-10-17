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
    return MyForm();
  }
}

class MyButton extends StatelessWidget {
  final formKey;
  final String label;

  const MyButton({Key key, this.formKey, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // I want to be able to retrieve the text via the controllers for the 2 text fields.
        // currently these values are empty which is the issue.
        print(
            'name: ${formKey.currentWidget.child.children[0].controller.text} ');
        print(
            'pass: ${formKey.currentWidget.child.children[1].controller.text} ');
      },
      child: Text(label),
    );
  }
}

class MyForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          MyField(
            title: 'name',
            controller: nameController,
          ),
          MyField(
            title: 'pass',
            controller: passController,
          ),
          MyButton(label: 'Button', formKey: formKey)
        ],
      ),
    );
  }
}

class MyField extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const MyField({this.controller, this.title});

  @override
  _MyFieldState createState() => _MyFieldState();
}

class _MyFieldState extends State<MyField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
    );
  }
}
