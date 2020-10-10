import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  double input;

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
    return TextField(
      inputFormatters: <TextInputFormatter>[
        CustomRangeTextInputFormatter(
          maxValue: 13.0,
          decimalLengthLimit: 1,
        ),
      ],
      textAlign: TextAlign.left,
      maxLines: 1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: '0 ',
        hintMaxLines: 4,
      ),
      onChanged: (value) {
        setState(() {
          print('onChanged: $value');
          if (value == null || value == '') {
            input = 0;
          }
        });
      },
      // controller: _inputController,
    );
  }
}

class CustomRangeTextInputFormatter extends TextInputFormatter {
  final double maxValue;
  final int decimalLengthLimit;

  CustomRangeTextInputFormatter(
      {@required this.maxValue, @required this.decimalLengthLimit});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.contains('.')) {
      return TextEditingValue().copyWith(text: oldValue.text);
    }
    if (newValue.text.isEmpty) {
      return TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (newValue.text.length == 1) {
      return TextEditingValue().copyWith(text: newValue.text);
    } else {
      return TextEditingValue().copyWith(text: newValue.text.substring(1, 2));
    }
  }
}
