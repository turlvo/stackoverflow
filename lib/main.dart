import 'dart:math';

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
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.blueGrey,
            isScrollControlled: false,
            builder: (context) => Wrap(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    title: Text(
                      'lists[index].listName',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                ),
              ],
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    List<Product> listProduct = [
      Product('Chicken Burger', 1, 20.5),
      Product('Chicken Wrap', 1, 9.99),
    ];
    double totalAmount = 0;
    for (var item in listProduct) {
      totalAmount += (item.price * item.quantity);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: min((listProduct.length + 1) * 20.0 + 10, 100),
      child: ListView(
        children: [
          ...listProduct
              .map(
                (prod) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      prod.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Text(
                      '${prod.quantity}x \$. ${prod.price}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              )
              .toList(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Text(
                  '$totalAmount',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                )
              ])
        ],
      ),
    );
  }
}

class Product {
  String title;
  int quantity;
  double price;

  Product(this.title, this.quantity, this.price);
}
