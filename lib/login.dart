import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _LoginUI(),
    );
  }
}

class _LoginUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<_LoginUI> {
  final _formKey = GlobalKey<FormState>();
  //FIXME When validate error occures, the fields get super small

  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    // child: Image.asset("assets/images/login_image.png"),
                    child: SizedBox(
                      height: 200,
                      child: Text('Login_image'),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                child: Container(
                                  height: 50,
                                  child: Text('LOGO'),
                                ),
                                //Image.asset("assets/images/logo.png",
                                //    width: 200, height: 50),
                              ),
                            )
                          ],
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(
                                    top: 40,
                                  ),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .90,
                                    height: 36,
                                    child: TextFormField(
                                      controller: _phoneNumber,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: const EdgeInsets.only(
                                            top: 2, bottom: 2, left: 8),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        hintText: "Email",
                                      ),
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: SizedBox(
                                  height: 36,
                                  width:
                                      MediaQuery.of(context).size.width * .90,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.only(
                                          top: 2, bottom: 2, left: 8),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      hintText: "Password",
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: 1, left: 10, right: 10),
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/password-reset");
                                      },
                                      child: Text("Forgot Password?",
                                          style: TextStyle(
                                              fontFamily: 'Roboto-Medium',
                                              fontSize: 14.0,
                                              letterSpacing: 1.25,
                                              color: Color.fromRGBO(
                                                  75, 56, 137, 80))),
                                    )),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 1, left: 10, right: 10),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .90,
                                    child: RaisedButton(
                                      color: Color.fromRGBO(75, 56, 137, 80),
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  75, 56, 137, 80))),
                                      child: Text(
                                        "LOGIN",
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                                      onPressed: () {
                                        String email = _phoneNumber.text;
                                        String password =
                                            _passwordController.text;

                                        if (_formKey.currentState.validate()) {
                                          // loginProcess(email, password);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(top: 1, left: 10, right: 10),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/register");
                              },
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: "Not a member yet? ",
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 14.0,
                                        letterSpacing: 0.25,
                                        color: Color.fromRGBO(75, 56, 137, 80)),
                                  ),
                                  TextSpan(
                                    text: "Create an Account",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14.0,
                                      letterSpacing: 0.25,
                                      color: Color.fromRGBO(75, 56, 137, 80),
                                    ),
                                  )
                                ]),
                              ),
                            )),
                        SizedBox(height: 400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
    //child: Image.asset("assets/images/login_image.png"),
  }
}
