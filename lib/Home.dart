import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Pages/ItemOne.dart';
import 'package:daily_goal_app/Pages/ItemTwo.dart';
import 'package:daily_goal_app/Pages/ItemThree.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indexPage = 0;

  final pageOptions = [

    ItemOne(),
    ItemTwo(),
    ItemThree()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(

        title: Text("Daily goal"),
        backgroundColor: Colors.grey[850],
      ),

      body: pageOptions[_indexPage],
      backgroundColor: Colors.white10,

      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,

        items: <Widget>[

            Icon(Icons.add, color: Colors.white, size: 30.0,),
            Icon(Icons.check, color: Colors.white, size: 30.0),
            Icon(Icons.group, color: Colors.white, size: 30.0)
          ],

        color: Colors.grey[850],
        buttonBackgroundColor: Colors.grey[800],
        backgroundColor: Colors.green[800],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),


        onTap: (int index){
            _indexPage = index;
        },
      ),
    );
  }
}
