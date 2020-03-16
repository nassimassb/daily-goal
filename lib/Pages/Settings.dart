import 'package:flutter/material.dart';
import '../Home.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Paramètres", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'whiteCupertino title')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>Home()));
          },
          tooltip: 'Retour',
        ),
      ),
      body: Container(

      ),
    );
  }
}
