import 'package:flutter/material.dart';
import 'package:flutter/src/material/radio_list_tile.dart';

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
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionRadio(
                text: 'Male',
                index: 0,
                selectedButton: selectedButton,
                press: (val) {
                  selectedButton = val;
                  setState(() {});
                }),
            OptionRadio(
                text: 'Female',
                index: 1,
                selectedButton: selectedButton,
                press: (val) {
                  selectedButton = val;
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}

class OptionRadio extends StatefulWidget {
  final String text;
  final int index;
  final int selectedButton;
  final Function press;

  const OptionRadio({
    Key key,
    this.text,
    this.index,
    this.selectedButton,
    this.press,
  }) : super();

  @override
  OptionRadioPage createState() => OptionRadioPage();
}

class OptionRadioPage extends State<OptionRadio> {
  // QuestionController controllerCopy =QuestionController();

  int id = 1;
  bool _isButtonDisabled;

  OptionRadioPage();

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  int _selected = null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.press(widget.index);
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  // height: 60.0,
                  child: Theme(
                data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                    disabledColor: Colors.blue),
                child: Column(children: [
                  RadioListTile(
                    title: Text(
                      "${widget.index + 1}. ${widget.text}",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      softWrap: true,
                    ),
                    /*Here the selectedButton which is null initially takes place of value after onChanged. Now, I need to clear the selected button when other button is clicked */
                    groupValue: widget.selectedButton,
                    value: widget.index,
                    activeColor: Colors.green,
                    onChanged: (val) async {
                      debugPrint('Radio button is clicked onChanged $val');
                      // setState(() {
                      //   debugPrint('Radio button setState $val');
                      //   selectedButton = val;
                      //   debugPrint('Radio button is clicked onChanged $widget.index');
                      // });
                      // SharedPreferences prefs = await SharedPreferences.getInstance();
                      // prefs.setInt('intValue', val);
                      widget.press(widget.index);
                    },
                    toggleable: true,
                  ),
                ]),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
