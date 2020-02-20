import 'package:flutter/material.dart';
import './Widgets/theme.dart';
import 'Home.dart';

void main()
{
  runApp(new MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: basicLightTheme(),
    darkTheme: basicDarkTheme(),
  ));
}