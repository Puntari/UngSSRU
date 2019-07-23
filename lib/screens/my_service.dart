import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' as prefix0; //3

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String namestring = '';

//Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      namestring = firebaseUser.displayName;
    });
    print('name = $namestring');
  } //เทรด

  Widget showDrawMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headMenu(),
          singOutAnExit(),
        ],
      ),
    );
  }

  Widget singOutAnExit() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
        size: 35.0,
        color: Colors.red,
      ),
      title: Text(
        'Sign Out & Exit',
        style: TextStyle(color: Colors.red, fontSize: 18.0),
      ),onTap: (){
        mySignOut(); //คอร

      }//ถ้าคลิกsign out ทำงานใน ontap,
    );
  }

  Future<void> mySignOut()async{

    await firebaseAuth.signOut().then((response){
      exit(0);
    });

  }//สร้าง-->คอร

  Widget headMenu() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.white, Colors.indigo[300]],
          radius: 1.0,
          center: Alignment.center,
        ),
      ), //พื้นหลังด้านกล่องบน
      child: Column(
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            child: Image.asset('images/logo.png'),
          ), //โชว์รูป
          Text(
            'My Hell',
            style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 25.0,
            ),
          ), //ชื่อแอป
          Text(
            'Login by $namestring',
            style: TextStyle(color: Colors.teal),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: Text('body'),
      drawer: showDrawMenu(),
    );
  }
}
