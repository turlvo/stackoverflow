import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Bar Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _vehicleReg = "";
  PlateNumber selectedPlatItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildUI(context),
    );
  }

  Widget buildAppBar() {
    return AppBar(title: Text('Search Reg Number'));
  }

  Widget buildUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildVehicleRegTxtField(context),
        SizedBox(height: 200),
        selectedVehicle(),
      ],
    );
  }

  Widget selectedVehicle() {
    return Container(
      child: Text(
        selectedPlatItem == null
            ? 'Selected vehicle will be displayed here.'
            : selectedPlatItem.regNumber,
      ),
    );
  }

  Widget _buildVehicleRegTxtField(BuildContext context) {
    return TextFormField(
      onSaved: (val) {
        _vehicleReg = val;
      },
      initialValue: selectedPlatItem?.regNumber,
      readOnly: true,
      onTap: () async {
        selectedPlatItem =
            await showSearch(context: context, delegate: PlateItemsSearch());
        print(selectedPlatItem);
        setState(() {});
      },
      style: TextStyle(
        color: Colors.blue,
        fontFamily: 'OpenSans',
        fontSize: 24,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Click for Vehicles',
      ),
    );
  }
}

class PlateItemsSearch extends SearchDelegate<PlateNumber> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myPlatesList = query.isEmpty
        ? loadPlateNumbers()
        : loadPlateNumbers().where((plate) {
            return plate.regNumber.contains(query);
          }).toList();
    return myPlatesList.isEmpty
        ? Text(
            'Plate Not Found',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )
        : ListView.builder(
            itemCount: myPlatesList.length,
            itemBuilder: (context, index) {
              final PlateNumber plateNumber = myPlatesList[index];
              return ListTile(
                leading: Icon(Icons.directions_car),
                onTap: () {
                  showResults(context);
                  close(context, plateNumber);
                },
                title: RichText(
                  text: TextSpan(
                    text: plateNumber.regNumber.substring(0, query.length),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: plateNumber.regNumber.substring(query.length),
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }
}

class PlateNumber {
  final int id;
  final String regNumber;

  PlateNumber({this.id, this.regNumber});
}

List<PlateNumber> loadPlateNumbers() {
  var pn = <PlateNumber>[
    PlateNumber(id: 1, regNumber: 'DE99ABC'),
    PlateNumber(id: 2, regNumber: 'AB22SDK'),
    PlateNumber(id: 3, regNumber: 'KS88ASD'),
    PlateNumber(id: 4, regNumber: 'NV37SSD'),
    PlateNumber(id: 5, regNumber: 'PT20KLK'),
    PlateNumber(id: 6, regNumber: 'TEST123'),
    PlateNumber(id: 7, regNumber: 'VT20QWE'),
    PlateNumber(id: 13, regNumber: 'JS23POP'),
    PlateNumber(id: 14, regNumber: 'XX12WWW'),
    PlateNumber(id: 15, regNumber: 'AB01RCA')
  ];
  return pn;
}
