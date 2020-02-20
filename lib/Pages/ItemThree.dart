import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ItemThree extends StatefulWidget {
  @override
  _ItemThreeState createState() => _ItemThreeState();
}

class _ItemThreeState extends State<ItemThree> {

  static const listOfItems = <String>[
    'Sport',
    'Lecture',
    'Coran',
  ];
  final List <DropdownMenuItem<String>>dropdownItems = listOfItems
  .map(
      (String value) => DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      ),
  )
  .toList();

  String selectedVal;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 20.0,
                margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text("Ajouter un ami", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
              SizedBox(height: 24.0,),
              TextFormField(

                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.person_add),
                  filled: true,
                  hintText: 'Entrez le nom d\'utilisateur de votre ami',
                  labelText: 'Nom',
                  fillColor: Colors.white24,
                ),
                onSaved: (String friendName) {},
              ),

              SizedBox(height: 48.0,),
              Container(
                child: Text('Mes objectifs',),
              ),
              Container(
                width: 200.0,
                child: DropdownButton(
                  value: selectedVal,
                  hint: Text('Choisissez votre objectif',),
                  items: dropdownItems,
                  onChanged: (String newValue){
                    setState(() {
                      selectedVal = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
