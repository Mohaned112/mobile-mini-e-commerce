import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
   textTheme: textTheme(),
  );
}
TextTheme textTheme(){
  return TextTheme(
    displayLarge:
    TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    displayMedium:
    TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    displaySmall:
    TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
  ),
    headlineMedium:
    TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
  ),
    headlineSmall:
    TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
  ),
    titleLarge:
    TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
  ),
    bodyLarge:
    TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
  ),
    bodyMedium:
    TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
  ),
  );

}