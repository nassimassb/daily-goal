import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:developer';

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
                      child: Text("Mes objectifs", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){

                          var ourdata = snapshot.data[index];
                          log('snapLength : ${snapshot.data.length}');

                          if(snapshot.data.length < 1){
                            return Container(
                              height: MediaQuery.of(context).size.height/1.5,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Text("Aucun objectif disponible", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
                              ),
                            );
                          }else{
                            return Container(
                              width: MediaQuery.of(context).size.width,
//                              height: 250.0,
                              child: Card(
                                elevation: 10.0,
                                margin: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.all(10.0),
                                                    child: CircleAvatar(
                                                      child: Text(ourdata.data["objectifs"][0]),
                                                      backgroundColor: Colors.green[800],
                                                      foregroundColor: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.0,),
                                                  Container(

                                                    child: Text(snapshot.data[index].data["objectifs"],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),)
                                                    ,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Container(
                                              child: IconButton(
                                                icon: Icon(Icons.more_vert,size: 25.0,),
                                                tooltip: 'Options',
                                                onPressed: (){

                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20.0),
                                        child: Table(
                                          border: TableBorder.all(color: Theme.of(context).textTheme.bodyText1.color),
                                          children: [
                                            TableRow( children: [
                                              Column(children:[
                                                Text('Nom')
                                              ]),
                                              Column(children:[
                                                Text('L')
                                              ]),
                                              Column(children:[
                                                Text('M')
                                              ]),
                                              Column(children:[
                                                Text('M')
                                              ]),
                                              Column(children:[
                                                Text('J')
                                              ]),
                                              Column(children:[
                                                Text('V')
                                              ]),
                                              Column(children:[
                                                Text('S')
                                              ]),
                                              Column(children:[
                                                Text('D')
                                              ]),
                                            ]),

                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 50.0,),
                                      Align(
                                        alignment: Alignment(0, -3.0),
                                        heightFactor: 1,

                                        child: RaisedButton(
                                          child: Icon(Icons.check),
                                          shape: CircleBorder(),
                                          padding: new EdgeInsets.all(15.0),
                                          color: Colors.green[800],
                                          textColor: Colors.white,
                                          elevation: 10.0,
                                          //tooltip: 'Cliquez pour valider votre objectif journalier',
                                          onPressed: (){

                                          },
                                          onLongPress: (){

                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          };

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

