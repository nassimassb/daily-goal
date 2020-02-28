import 'package:daily_goal_app/Pages/MyAccount.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Pages/ItemOne.dart';
import 'Pages/ItemTwo.dart';
import 'Pages/ItemThree.dart';
import 'Pages/Settings.dart';

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

          title: Container(
            margin: EdgeInsets.only(left: 30.0),
            child: Row(
              children: <Widget>[
                IconButton(

                  icon: Image.asset('assets/images/dailygoal_logo.png'),
                  iconSize: 40.0,
                ),
                Text("Daily goal"),
              ],
            ),
          )
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.grey[850],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    tooltip: 'Cliquez pour cacher ce menu',
                  ),
                ),
              ),
              UserAccountsDrawerHeader(
                accountName: Text("Nassim", style: TextStyle(fontSize: 20.0),),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white,),
                title: Text('Mon compte', style: TextStyle(color: Colors.white),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>MyAccount()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white,),
                title: Text('Paramètres', style: TextStyle(color: Colors.white),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>Settings()));
                },
              ),
            ],
          ),
        ),
      ),

      body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: pageOptions[_indexPage]
      ),
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
            Icon(Icons.add_circle, color: Colors.white, size: 30.0),
            Icon(Icons.group, color: Colors.white, size: 30.0)
          ],

          color: Colors.grey[850],
          buttonBackgroundColor: Colors.grey[800],
          backgroundColor: Colors.green[800],
          animationCurve: Curves.easeInOutCirc,
          animationDuration: Duration(milliseconds: 300),


          onTap: (int index) {
            setState(() {
              _indexPage = index;
            });
          },
        ),
      ),
    );
  }
}
