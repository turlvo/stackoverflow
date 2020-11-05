import 'package:flutter/material.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RichText Controller Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: RichTextControllerDemo()),
    );
  }
}

class RichTextControllerDemo extends StatefulWidget {
  @override
  _RichTextControllerDemoState createState() => _RichTextControllerDemoState();
}

class _RichTextControllerDemoState extends State<RichTextControllerDemo> {
// Add a controller
  RichTextController _controller;

  @override
  void initState() {
    // initialize with your custom regex patterns and styles
    _controller = RichTextController({
      //
      //* Returns every Hashtag with red color
      //
      RegExp(r"\B#[a-zA-Z0-9]+\b"): TextStyle(color: Colors.red),
      //
      //* Returns every Mention with blue color and bold style.
      //
      RegExp(r"\B@[a-zA-Z0-9]+\b"): TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.blue,
      ),
      //
      //* Returns every word after '!' with yellow color and italic style.
      //
      RegExp(r"\B![a-zA-Z0-9]+\b"):
          TextStyle(color: Colors.yellow, fontStyle: FontStyle.italic),
      // add as many expressions as you need!
    },

        //! starting v1.1.0
        // Now you have an onMatch callback that gives you access to a List<String>
        // which contains all matched strings
        onMatch: (List<String> matches) {
      // Do something with matches.
      //! P.S
      // as long as you're typing, the controller will keep updating the list.
    }
        //!
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: TextField(
      controller: _controller,
    ));
  }
}
