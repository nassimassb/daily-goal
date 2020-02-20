import 'package:flutter/material.dart';

ThemeData basicLightTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
      headline5: base.headline5.copyWith(
          fontFamily: 'Feelin sweet',
          fontSize: 30.0,
          color: Colors.red,
      )
    );
  }
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.grey[850],
    canvasColor: Colors.grey[700],
    scaffoldBackgroundColor: Colors.grey[400],
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[600],
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}

ThemeData basicDarkTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
        headline5: base.headline5.copyWith(
          fontFamily: 'Feelin sweet',
          fontSize: 30.0,
          color: Colors.red,
        )
    );
  }
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.grey[850],
    canvasColor: Colors.grey[700],
    scaffoldBackgroundColor: Colors.grey[900],
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[800],
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}


