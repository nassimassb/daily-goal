import 'package:flutter/material.dart';

ThemeData basicLightTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
      headline6: base.headline6.copyWith(
          fontFamily: 'Feelin sweet',
          fontSize: 30.0,
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
      actionTextColor: Colors.white,
    ),
    cardColor: Colors.white60,
    appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline6: TextStyle(fontFamily: 'Feelin Sweet', fontSize: 30.0,color: Colors.white),
        )
    ),
    tooltipTheme: TooltipThemeData(
        showDuration: Duration(seconds: 3),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: TextStyle(color: Colors.white)
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[700],
    )
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
    canvasColor: Colors.grey[800],
    scaffoldBackgroundColor: Colors.grey[900],
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[800],
      contentTextStyle: TextStyle(color: Colors.white),
      actionTextColor: Colors.white,
    ),
    cardColor: Colors.white24,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(fontFamily: 'Feelin Sweet', fontSize: 30.0,color: Colors.white),
      )
    ),
    tooltipTheme: TooltipThemeData(
      showDuration: Duration(seconds: 3),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(5.0),
      ),
      textStyle: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textSelectionColor: Colors.blue,
    textSelectionHandleColor: Colors.blue,
  );
}


