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
    );
  }

  Widget _buildBody() {
    return Calendar_page();
  }
}

class Calendar_page extends StatefulWidget {
  @override
  _Calendar_pageState createState() => _Calendar_pageState();
}

class _Calendar_pageState extends State<Calendar_page> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          alignment: Alignment.topCenter,
          color: const Color(0xFFF0F0F0),
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "Oct",
                      style: TextStyle(
                        fontFamily: "Montserrat Regular",
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF263064),
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          text: " 2021",
                          style: TextStyle(
                            fontFamily: "Montserrat Regular",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                "Today",
                style: TextStyle(
                  fontFamily: "Montserrat Regular",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF3E3993),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 100,
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 35, bottom: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildDate("S", 1, false),
                      buildDate("M", 2, true),
                      buildDate("T", 3, false),
                      buildDate("W", 4, false),
                      buildDate("T", 5, false),
                      buildDate("F", 6, false),
                      buildDate("S", 7, false),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTaskList(
                            " 09:00",
                            " AM",
                            "1 h 54 min",
                            "Theory of Psychology",
                            "John Tamad",
                            "Theories are used to provide a model for understanding human thoughts, emotions, and behaviors. A psychological theory has two key components: It must describe a behavior. It must make predictions about future behaviors."),
                        buildTaskList(
                            " 10:30",
                            " AM",
                            "35 min",
                            "Conscience in Science",
                            "Maria Tagud",
                            "Conscience is a cognitive process that elicits emotion and rational associations based on an individual's moral philosophy or value system. Common secular or scientific views regard the capacity for conscience as probably genetically determined, with its subject probably learned or imprinted as part of a culture."),
                        buildTaskList(
                            " 04:00",
                            " PM",
                            "1 h 26 min",
                            "Computer Hardware",
                            "Kurt Bear",
                            "The computer is an amazingly useful general-purpose technology, to the point that now cameras, phones, thermostats, and more are all now little computers. This section will introduce major parts and themes of how computer hardware works. Hardware refers the physical parts of the computer, and software refers to the code that runs on the computer."),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container buildTaskList(String time1, String time2, String hour, String sub,
      String Teach, String des) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(5),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: time1,
                              style: const TextStyle(
                                fontFamily: "Montserrat Regular",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: time2,
                                  style: const TextStyle(
                                    fontFamily: "Montserrat Regular",
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            hour,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 185),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 70, left: 30),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sub,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 9,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/originals/90/c8/d0/90c8d0fde36b92c18a6c19a06b4b2735.jpg"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Teach,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.description, size: 20),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Subject Description",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              des,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDate(String weekday, int date, bool isActive) {
    return Container(
      decoration: isActive
          ? BoxDecoration(
              color: const Color(0xff402fcc),
              borderRadius: BorderRadius.circular(6),
            )
          : BoxDecoration(),
      height: 38,
      width: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            weekday,
            style: const TextStyle(
              fontFamily: "Montserrat Regular",
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
          Text(
            date.toString(),
            style: TextStyle(
              fontFamily: "Montserrat Regular",
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
