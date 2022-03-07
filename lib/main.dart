import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  WebViewController _controller;
  bool buttonshow = false;

  @override
  void initState() {
    super.initState();
  }

  void scrollToTop() {
    _controller
        .evaluateJavascript("window.scrollTo({top: 0, behavior: 'smooth'});");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        onPageFinished: (String url) async {
          _controller.evaluateJavascript(
              "window.onscroll = function () {scrollEventChannel.postMessage(window.scrollY)};");
        },
        javascriptChannels: {
          JavascriptChannel(
              name: 'scrollEventChannel',
              onMessageReceived: (JavascriptMessage message) {
                print('>>>>: ${message.message}');

                int position = int.parse(message.message);
                if (position == 0) {
                  setState(() {
                    buttonshow = false;
                  });
                } else if (position > 60) {
                  setState(() {
                    buttonshow = true;
                  });
                }
              }),
        },
      ),
      floatingActionButton: Visibility(
        visible: buttonshow,
        child: FloatingActionButton(
          onPressed: () {
            scrollToTop();
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.navigation),
        ),
      ),
    );
  }
}
