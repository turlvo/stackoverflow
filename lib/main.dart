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
      body: Americano(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}

class Americano extends StatefulWidget {
  @override
  _AmericanoState createState() => _AmericanoState();
}

class _AmericanoState extends State<Americano> {
  List<addonsize> listSize = [];
  List<addontopping> listTopping = [
    addontopping(
      id: 8,
      topping: 'Whipcream',
      price: 0,
      isCheck: true,
    ),
    addontopping(
      id: 9,
      topping: 'Javachip',
      price: 30,
      isCheck: false,
    ),
    addontopping(
      id: 10,
      topping: 'SoyMilk',
      price: 20,
      isCheck: false,
    ),
    addontopping(
      id: 11,
      topping: 'ExtraSyrup',
      price: 30,
      isCheck: false,
    ),
  ];
  var items = [
    Beverages(name: 'a', price: 11111, img: ''),
    Beverages(name: 'b', price: 222, img: ''),
    Beverages(name: 'c', price: 333, img: ''),
    Beverages(name: 'd', price: 444, img: '')
  ];

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/lightwood.jpg'),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          primary: false,
          padding: const EdgeInsets.all(100),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(items[1].img),
                  //   ),
                  // ),
                ),
                Text(
                  items[1].name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.brown),
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  child: Text(
                    items[1].price.toStringAsFixed(0) + ' บาท',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.brown),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listTopping.length,
                      itemBuilder: (BuildContext context, int i) {
                        return new Card(
                          child: new Container(
                            padding: new EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                CheckboxListTile(
                                  activeColor: Colors.blue,
                                  dense: true,
                                  //font change
                                  title: new Text(
                                    listTopping[i].topping,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: listTopping[i].isCheck,
                                  secondary: Container(
                                    height: 50,
                                    width: 50,
                                    child: Text(listTopping[i]
                                        .price
                                        .toStringAsFixed(0)),
                                  ),
                                  onChanged: (bool val) {
                                    itemChange(val, i);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void itemChange(bool val, int i) {
    setState(() {
      listTopping[i].isCheck = val;
    });
  }
}

class addonsize {
  int id;
  String size;
  double price;

  addonsize({
    @required this.id,
    @required this.size,
    @required this.price,
  });
}

List<addonsize> listSize = [
  addonsize(
    id: 6,
    size: 'Grande',
    price: 30,
  ),
  addonsize(
    id: 7,
    size: 'Venti',
    price: 50,
  ),
];

class Beverages {
  String name;
  int price;
  String img;

  Beverages({this.name, this.price, this.img});
}

class addontopping {
  int id;
  String topping;
  double price;
  bool isCheck;

  addontopping({
    @required this.id,
    @required this.topping,
    @required this.price,
    @required this.isCheck,
  });
}

List<addontopping> listTopping = [
  addontopping(
    id: 8,
    topping: 'Whipcream',
    price: 0,
    isCheck: true,
  ),
  addontopping(
    id: 9,
    topping: 'Javachip',
    price: 30,
    isCheck: false,
  ),
  addontopping(
    id: 10,
    topping: 'SoyMilk',
    price: 20,
    isCheck: false,
  ),
  addontopping(
    id: 11,
    topping: 'ExtraSyrup',
    price: 30,
    isCheck: false,
  ),
];
