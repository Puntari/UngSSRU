import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:ung_ssru/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  double mySize = 180.0;

  // Method

  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.green[200],
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');

        //Create Route
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
            Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.green[300],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.blueGrey),
      ),
      onPressed: () {},
    );
  }

  Widget myButton() {
    return Container(
      width: 220.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(labelText: 'Email :', hintText: 'you@email.com'),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: mySize,
      height: mySize,
      child: Image.asset(
        'images/logo.png',
        
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText() {
    return Text(
      'Welcome To My Hell',
      style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.red[300],
          fontFamily: 'AmaticSC'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.green, Colors.amber],
          begin: Alignment.topCenter,
        )),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showText(),
            emailText(),
            passwordText(),
            myButton(),
          ],
        ),
      ),
    );
  }
}
