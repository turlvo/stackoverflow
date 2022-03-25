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
    return FilterDialogUser();
  }
}

class FilterDialogUser extends StatefulWidget {
  FilterDialogUser({Key key}) : super(key: key);

  @override
  State<FilterDialogUser> createState() => _FilterDialogUserState();
}

class _FilterDialogUserState extends State<FilterDialogUser> {
  Map<String, List<String>> filters = {};
  bool needRefresh = false;
  List<bool> isClickedCountry = List.filled(3, false);

  @override
  void initState() {
    super.initState();
    // filters = widget.initialState;
  }

  List<FilterItem> children = [
    FilterItem('Georgia', subitems: [
      FilterItem('Tbilisi'),
      FilterItem('Batumi'),
    ]),
    FilterItem('Poland', subitems: [
      FilterItem('Warsaw'),
      FilterItem('Krakow'),
      FilterItem('Wroclaw'),
    ]),
    FilterItem('Armenia', subitems: [
      FilterItem('Erevan'),
      FilterItem('Gyumri'),
    ]),
  ];

  // Building a dialog box with filters.
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: const Text('Filters',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'SuisseIntl',
            )),
        contentPadding: const EdgeInsets.all(16),

        // Defining parameters for filtering.
        children: [
          Column(
            children: children.map(
              (e) {
                final int index = children.indexOf(e);
                return Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        setState(() {
                          isClickedCountry[index] = !isClickedCountry[index];
                        });
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: e.selected,
                            onChanged: (value) => setState(() {
                              e.subitems.forEach((element) =>
                                  element.selected = value as bool);
                              e.selected = value as bool;
                            }),
                          ),
                          Text(e.text),
                          const Spacer(),
                          isClickedCountry[index]
                              ? const Icon(Icons.arrow_circle_up)
                              : const Icon(Icons.arrow_circle_down)
                        ],
                      ),
                    ),
                    if (e.subitems.isNotEmpty)
                      !isClickedCountry[index]
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Column(
                                children: e.subitems.map((e) {
                                  return Row(children: [
                                    Checkbox(
                                      value: e.selected,
                                      onChanged: (value) => setState(() {
                                        e.selected = value as bool;
                                      }),
                                    ),
                                    Text(e.text),
                                  ]);
                                }).toList(),
                              ),
                            )
                  ],
                );
              },
            ).toList(),
          ),
        ]);
  }
}

class FilterItem {
  final String text;
  bool selected;
  List<FilterItem> subitems;

  FilterItem(
    this.text, {
    this.selected = false,
    this.subitems = const [],
  });
}
