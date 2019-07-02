import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  double mySize = 180.0;

  // Method

  Widget signInButton() {
    return RaisedButton(
      child: Text('Sign In'), onPressed: (){},
    );
  }

  Widget myButton() {
    return Container(
      width: 220.0,
      child: Row(
        children: <Widget>[signInButton(), signInButton()],
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
      'Yaaa Hoo',
      style: TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
          fontFamily: 'AmaticSC'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
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
