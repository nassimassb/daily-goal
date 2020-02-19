import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTwo extends StatefulWidget {
  @override
  _ItemTwoState createState() => _ItemTwoState();
}

class _ItemTwoState extends State<ItemTwo> {

  static const listOfItems = <String>[
    'Dimanche',
    'Lundi',
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
      backgroundColor: Colors.grey[900],
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 20.0,
                margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text("Nouvel objectif journalier", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0)),
              ),
              SizedBox(height: 24.0,),
              TextFormField(

                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.assignment_turned_in,color: Colors.white,),
                  filled: true,
                  hintText: 'Entrez le nom de votre objectif journalier',
                  labelText: 'Nom',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white24,
                ),
              ),

              SizedBox(height: 24.0,),
              TextFormField(

                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, decorationColor: Colors.green),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.calendar_today,color: Colors.white,),
                  filled: true,
                  hintText: 'Exemple: 3 fois/semaine',
                  labelText: 'Fréquence hebdomadaire',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white24,
                ),
              ),

              SizedBox(height: 24.0,),
              TextFormField(

                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, decorationColor: Colors.green),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.calendar_today,color: Colors.white,),
                  filled: true,
                  hintText: 'Exemple: 3 fois/jour',
                  labelText: 'Fréquence journalière',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white24,
                ),
              ),

              SizedBox(height: 24.0,),
              TextFormField(

                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, decorationColor: Colors.green),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.timer,color: Colors.white,),
                  filled: true,
                  hintText: 'Exemple: La journée commencera à 3H',
                  labelText: 'Heure de départ',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white24,
                ),
              ),

              SizedBox(height: 48.0,),
              Container(
                child: Text('Premier jour de la semaine', style: TextStyle(color: Colors.white),),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white60,
                ),
                child: Container(
                  width: 290.0,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: DropdownButton(
                    value: selectedVal,
                    style: TextStyle(color: Colors.white),
                    hint: Text('Selectionnez le premier jour de la semaine', style: TextStyle(color: Colors.white24),),
                    items: dropdownItems,
                    onChanged: (String newValue){
                      setState(() {
                        selectedVal = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
