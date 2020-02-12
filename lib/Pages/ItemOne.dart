import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class ItemOne extends StatefulWidget {
  @override
  _ItemOneState createState() => _ItemOneState();
}

class _ItemOneState extends State<ItemOne> {

  Future getHomePost() async {

    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("HomeData").getDocuments();
    return snap.documents;
  }

  Future<Null> getRefresh() async {

    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getHomePost();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: FutureBuilder(

          future: getHomePost(),
          builder: (context, snapshot){

            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(

                child: CircularProgressIndicator(),
              );
            }else{
              return RefreshIndicator(
                onRefresh: getRefresh,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20.0,
                      margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text("Mes objectifs", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          return Container(
                              child: Column(
                                children: <Widget>[

                                  Card(
                                    elevation: 10.0,
                                    margin: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
                                    color: Colors.grey[600],
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 250.0,
                                      child: Column(
                                        children: <Widget>[

                                          Text(snapshot.data[index].data["objectifs"],style: TextStyle(fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        )

        )
      );
  }
}

