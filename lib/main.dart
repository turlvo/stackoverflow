import 'package:flutter/material.dart';

void main() {
  runApp(TradingPage());
}

class TradingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffaa249e),
          title: Text('Relatable'),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 6,
                offset: Offset(0, 1),
              )
            ],
          ),
          height: 30.0,
          child: SeasonListWidget(),
        ),
      ),
    );
  }
}

Season venus = Season('Venus');
Season helado = Season('Helado');
Season year1800s = Season('1800s');
Season neon = Season('Neon');
Season ritmo = Season('Ritmo');
Season lente = Season('Lente');
Season gemas = Season('Gemas');

var seasonsList = [venus, helado, year1800s, neon, ritmo, lente, gemas];

class SeasonListWidget extends StatefulWidget {
  @override
  _SeasonListWidgetState createState() => _SeasonListWidgetState();
}

class _SeasonListWidgetState extends State<SeasonListWidget> {
  int clickedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  Center seasonBarItem({@required Season season, @required index}) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: () {
            setState(() {
              clickedIndex = index;
            });
          },
          child: Text(
            season.name,
            style: TextStyle(
              color:
                  clickedIndex == index ? Color(0xff000000) : Color(0xff808080),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 75.0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return seasonBarItem(season: seasonsList[index], index: index);
      },
    );
  }
}

class Season<Widget> {
  String name;

  Season(this.name);

  void changeNameColor() {}
}
