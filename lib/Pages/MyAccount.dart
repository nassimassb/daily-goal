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
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>Home()));
                  },
                  tooltip: 'Retour',
                ),
              ),
              Container(
                height: 20.0,
                margin: const EdgeInsets.only(left: 70.0, bottom: 10.0),
                child: Text("Mon compte", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
