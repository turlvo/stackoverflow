import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 225),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Find Your New Job',
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  constraints: BoxConstraints.expand(height: 200),
                  child: ListView(
                      padding: EdgeInsets.only(left: 40),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(),
                        Container(),
                      ]),
                ),
                Container(
                  height: 500,
                  margin: EdgeInsets.only(top: 300),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Text(
                          "Explore New Opportunities",
                        ),
                      ),
                      Container(
                        height: 400,
                        child: ListView(
                          children: getJobCategories(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<String> jobCategories = [
    "Sales",
    "Engineering",
    "Health",
    "Education",
    "Finance"
  ];

  Map jobCatToIcon = {
    "Sales": Icon(
      Icons.monetization_on,
      color: Colors.blue,
      size: 50,
    ),
    "Engineering": Icon(Icons.settings, color: Colors.blue, size: 50),
    "Health": Icon(Icons.healing, color: Colors.blue, size: 50),
    "Education": Icon(Icons.search, color: Colors.blue, size: 50),
    "Finance": Icon(Icons.card_membership, color: Colors.blue, size: 50),
  };

  Widget getCategoryContainer(String categoryName) {
    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            categoryName,
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: jobCatToIcon[categoryName],
              elevation: 10,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    for (String category in jobCategories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category));
        i++;
      }
    }
    if (rows.length > 0) {
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }
}
