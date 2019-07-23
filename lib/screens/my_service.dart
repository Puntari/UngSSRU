import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//Explicit

//Method
  Widget showDrawMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headMenu(),
        ],
      ),
    );
  }

  Widget headMenu() {
    return DrawerHeader(
      decoration: BoxDecoration(),
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
              color: Colors.lime,
              fontSize: 25.0,
            ),
          ),//ชื่อแอป
          Text(
            'Login by ...',
            style: TextStyle(color: Colors.amber),
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
