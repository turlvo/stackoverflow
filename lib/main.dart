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
        backgroundColor: const Color(0xFF263238),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: IconButton(
                            icon: Image.asset(
                              "assets/images/back_icon.png",
                              height: 30,
                              width: 30,
                            ),
                            iconSize: 40,
                            onPressed: () {
                              // Go to previews screen
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8, top: 12),
                          child: const Text(
                            "My Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 23),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(top: 15, right: 10),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 45.0, right: 40.0),
                            child: Row(
                              children: const [
                                Text("Username",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17)),
                                Spacer()
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 72, 92, 105)),
                            margin: const EdgeInsets.only(
                                top: 5.0, left: 40.0, right: 40.0),
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              // controller: usernameController,
                              onChanged: (usernameInput) {
                                // setState(() {
                                //   username = usernameInput;
                                //   isSaveButtonEnabled = true;
                                // });
                              },
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Username"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 45.0, right: 40.0),
                              child: Row(
                                children: const [
                                  Text("Email address",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 17)),
                                  Spacer()
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 72, 92, 105)),
                              margin: const EdgeInsets.only(
                                  top: 5.0, left: 40.0, right: 40.0),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                // controller: emailController,
                                onChanged: (emailInput) {
                                  // setState(() {
                                  //   email = emailInput;
                                  //   isSaveButtonEnabled = true;
                                  // });
                                },
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                    hintText: "Email address"),
                              ),
                            )
                          ],
                        )),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      width: 370,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.indigo),
                        child: Text("saveButtonText",
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      width: 370,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.indigo),
                        child: const Text("Change password",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      width: 370,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // CoolAlert.show(
                          //   onConfirmBtnTap: logout,
                          //   onCancelBtnTap: () {
                          //     Navigator.of(context).pop();
                          //   },
                          //   context: context,
                          //   type: CoolAlertType.confirm,
                          //   text: 'Do you want to logout?',
                          //   confirmBtnText: 'Yes',
                          //   cancelBtnText: 'No',
                          //   confirmBtnColor: Colors.red,
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.red),
                        child: const Text("Logout",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Text(
            "Made by George Sepetadelis",
            style: TextStyle(color: Colors.grey, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
