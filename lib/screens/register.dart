import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ung_ssru/screens/my_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explict
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordStaring;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name:',
        labelStyle: TextStyle(color: Colors.blue),
        helperText: 'Type Display Name',
        helperStyle: TextStyle(color: Colors.blue),
        icon: Icon(
          Icons.face,
          size: 60.0,
          color: Colors.blue,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name in Blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email:',
        labelStyle: TextStyle(color: Colors.pink),
        helperText: 'Type you@email.com',
        helperStyle: TextStyle(color: Colors.pinkAccent),
        icon: Icon(
          Icons.email,
          size: 45.0,
          color: Colors.pink,
        ),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Type Email Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password:',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'More 6 Charactor',
        helperStyle: TextStyle(color: Colors.green),
        icon: Icon(
          Icons.lock,
          size: 45.0,
          color: Colors.green,
        ),
      ),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Pass Much More 6 Charactor';
        }
      },
      onSaved: (String value) {
        passwordStaring = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'Name = $nameString, Email = $emailString, Pass = $passwordStaring');
          register(); //1
        }
      },
    );
  }

  Future<void> register() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailString,
      password: passwordStaring,
    )
        .then((objResponse) {
      print('Register Success');
      setUpDisplayName(); //4
    }).catchError((objResponse) {
      print('${objResponse.toString()}');
      myAlert(objResponse.code.toString(), objResponse.message.toString()); //2
    });
  } //เป็นเทรด1

  Future<void> setUpDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = nameString;
      response.updateProfile(updateInfo);

      var serviceRoute = MaterialPageRoute(
          builder: (BuildContext context) => MyService()); //ทำแบบย้อนลับไม่ได้
      Navigator.of(context).pushAndRemoveUntil(
          serviceRoute, (Route<dynamic> route) => false); //ย้อนกลับไม่ได้
    }); //5
  } //เทรด2 //4

  void myAlert(String titleString, String messageString) {
    //1
    showDialog(
      //3
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleString,
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            messageString,
            style: TextStyle(color: Colors.blue),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    ); //สร้างป็อปอัพ
  } //เมทตอด

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.red[500],
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bbg.jpg'), fit: BoxFit.cover),
          ),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 60.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.5)),
            width: 300.0,
            height: 300.0,
            child: Column(
              children: <Widget>[
                nameText(),
                emailText(),
                passwordText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
