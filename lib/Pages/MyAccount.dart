import 'package:flutter/material.dart';
import '../Home.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mon compte", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'whiteCupertino title')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>Home()));
          },
          tooltip: 'Retour',
        ),
      ),
      body: Container(

      ),
    );;
  }
}
