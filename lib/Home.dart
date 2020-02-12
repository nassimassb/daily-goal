import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Pages/ItemOne.dart';
import 'Pages/ItemTwo.dart';
import 'Pages/ItemThree.dart';

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
        leading: Container(
          child: IconButton(

            icon: Image.asset('assets/images/dailygoal_logo.png'),
            iconSize: 40.0,
          ),
        ),
        title: Text("Daily goal",style: TextStyle(fontFamily: 'Feelin Sweet', fontSize: 30.0)),
        backgroundColor: Colors.grey[850],

      ),

      body: pageOptions[_indexPage],
      backgroundColor: Colors.grey[900],

      bottomNavigationBar: Container(
        height: 55.0,
        decoration:
        new BoxDecoration(color: Colors.green),
        child: CurvedNavigationBar(
          height: 50.0,
          index: 0,
          items: <Widget>[

            Icon(Icons.home, color: Colors.white, size: 30.0,),
            Icon(Icons.check, color: Colors.white, size: 30.0),
            Icon(Icons.group, color: Colors.white, size: 30.0)
          ],

          color: Colors.grey[850],
          buttonBackgroundColor: Colors.grey[800],
          backgroundColor: Colors.green[800],
          animationCurve: Curves.easeInOutCirc,
          animationDuration: Duration(milliseconds: 300),


          onTap: (int index){

            setState(() {
              _indexPage = index;
            });
          },
        ),
      ),
    );
  }
}
