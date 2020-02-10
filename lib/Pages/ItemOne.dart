import 'package:flutter/material.dart';

class ItemOne extends StatefulWidget {
  @override
  _ItemOneState createState() => _ItemOneState();
}

class _ItemOneState extends State<ItemOne> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[900],

      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: Container(
          child: Container(
              height: 20.0,
              margin: const EdgeInsets.only(top: 20.0, bottom: 30.0),
              child: Text("Mes objectifs", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0)),
            )
        ),

        )
      );
  }
}

