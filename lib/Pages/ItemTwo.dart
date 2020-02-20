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

  static const listOfItemsWeek = <String>[
    '1x',
    '2x',
    '3x',
    '4x',
    '5x',
    '6x',
    '7x',
  ];
  final List <DropdownMenuItem<String>>dropdownItemsWeek = listOfItemsWeek
  .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
  .toList();

  String selectedVal;
  String selectedValWeek;
  bool checkValue = false;
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
                child: Text("Nouvel objectif journalier", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
              SizedBox(height: 24.0,),
              TextFormField(

                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.assignment_turned_in),
                  filled: true,
                  hintText: 'Entrez le nom de votre objectif journalier',
                  labelText: 'Nom',
                  fillColor: Colors.white24,
                ),
              ),

              SizedBox(height: 24.0,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.calendar_today),
                  filled: true,
                  hintText: 'Exemple: 3 fois/jour',
                  labelText: 'Fréquence journalière',
                  fillColor: Colors.white24,
                ),
              ),

              SizedBox(height: 24.0,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    SizedBox(width: 16.0,),
                    RaisedButton(
                      color: Colors.white24,
                      child: Text('Cliquez pour choisir l\'heure de départ'),
                      padding: const EdgeInsets.only(left: 20.0, right: 78.0, top: 20.0,bottom: 20.0),
                      onPressed: (){
                        DateTime now = DateTime.now();
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
                        ).then((TimeOfDay value){
                          if(value != null){
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Votre objectif débutera à ${value.format(context)} et finira le lendemain à la même heure'),
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 48.0,),
              Text('Fréquence hebdomadaire'),
              Container(
                child: DropdownButton(
                  value: selectedValWeek,
                  hint: Text('Combien de fois/semaine effectuerez-vous l\'action?',style: TextStyle(fontSize: 15),),
                  items: dropdownItemsWeek,
                  onChanged: (String newValue){
                    setState(() {
                      selectedValWeek = newValue;
                    });
                  },
                ),
              ),

              SizedBox(height: 48.0,),
              Text('Premier jour de la semaine'),
              Container(
                child: DropdownButton(
                  value: selectedVal,
                  hint: Text('Selectionnez le premier jour de la semaine',),
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
