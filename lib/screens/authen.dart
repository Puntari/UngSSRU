import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:ung_ssru/screens/my_service.dart';
import 'package:ung_ssru/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  double mySize = 180.0;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String emailString = '', passwordString = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Method

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseUser firebaseUser =
        await firebaseAuth.currentUser(); //เก็บ data คนที่ล็อคอิน
    if (firebaseUser != null) {
      //ไม่เท่ากับความว่าง = ล็อคอิน
      moveToService();
    }
  } //เทรด

  void moveToService() {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

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
      onPressed: () {
        formKey.currentState.save();
        checkAuthen();
      },
    );
  }

  Future<void> checkAuthen() async {
    print('email =$emailString, password =$passwordString');
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Authen Success');
      moveToService();
    }).catchError((response) {
      String errorString = response.message;
      print('error =$errorString');
      myShowSnackBar(errorString); //คอรmyshowsnackBar
    });
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
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
        ),
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'you@email.com',
        ),
        onSaved: (String value) {
          emailString = value;
        },
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

  void myShowSnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
      backgroundColor: Colors.yellow,
      duration: Duration(seconds: 8), //เวลาขึ้นแถบล่าง
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
        textColor: Colors.green,
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  } //แถบดำล่างที่กรอกผิด //คอรmyshowsnackBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.green, Colors.amber],
          begin: Alignment.topCenter,
        )),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, //เลือกว่าให้หน้าแรกอยู่ บนกลาง ล่าง 
            children: <Widget>[
              showLogo(),
              showText(),
              emailText(),
              passwordText(),
              myButton(),
            ],
          ),
        ),
      ),
    );
  }
}
