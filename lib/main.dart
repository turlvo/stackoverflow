import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appcastURL =
        'https://raw.githubusercontent.com/jeejaykim/apispa/jeejaykim-test/test.xml';
    final cfg =
        AppcastConfiguration(url: appcastURL, supportedOS: ['android', 'ios']);
    return MaterialApp(
      title: 'Upgrader Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Upgrader Example'),
        ),
        body: UpgradeAlert(
            dialogStyle: UpgradeDialogStyle.cupertino,
            appcastConfig: cfg,
            debugLogging: true,
            showLater: false,
            showIgnore: false,
            minAppVersion: '120.0.0',
            child: Container(width: 0, height: 0)),
      ),
    );
  }
}
