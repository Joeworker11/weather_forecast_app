import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.deepOrangeAccent;
const COLOR_ACCENT = Colors.orange;
const COLOR_NIGHT = Colors.cyan;
const COLOR_BUTTON_ALPHABET = Colors.white;

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: COLOR_PRIMARY,
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: COLOR_ACCENT),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor: MaterialStateProperty.all<Color>(
                COLOR_ACCENT) // Bejelentkezés gomb formázása, szín és gömbölyded forma
        )),
    //textTheme: TextTheme(
    //headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
    // )
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide
                .none // none, mert nem akarok mutatni határokat a beviteli mezőben
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.white,
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
      thumbColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide
                .none // none, mert nem akarok mutatni határokat a beviteli mezőben
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)),
    elevatedButtonTheme: ElevatedButtonThemeData(
style: ButtonStyle(
padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder
(
borderRadius: BorderRadius.circular(20.0
)
)
)
,
backgroundColor: MaterialStateProperty.all<Color>(COLOR_NIGHT),
foregroundColor: MaterialStateProperty.all<Color>(COLOR_BUTTON_ALPHABET),
overlayColor: MaterialStateProperty.all<Color>(Colors
    .black26) // Bejelentkezés gomb formázása, szín és gömbölyded forma
)
)
,
);
