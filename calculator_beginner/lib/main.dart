import 'dart:convert';
import 'dart:math';

import 'package:calculator_beginner/buttons.dart';
import "package:flutter/material.dart";
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'TÖRLÉS',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    'ANS',
    '0',
    ',',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: Column(
        children: <Widget>[
          // a számológép felső felét reprezentálja
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // hézagot hagy a két szó között
                children: <Widget>[
                  SizedBox(height: 50,), // a fölső margótól való hézag
                  Container(
                    padding: EdgeInsets.all(20), // nem fog hozzáérni a margóhoz teljesen
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestion, style: TextStyle(fontSize: 20),),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer, style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: (){
                          setState(() {
                            userQuestion = '';
                            userAnswer = '';

                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.greenAccent,
                        textColor: Colors.white,
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonTapped: (){
                          setState(() {
                            userQuestion = userQuestion.substring(0, userQuestion.length-1); // csak az utolsó karaktert törölje ki
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    }else if (index == buttons.length-1) {    // egyenlőség gomb
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });

                        },
                        buttonText: buttons[index],
                        color: Colors.amber[600],
                        textColor: Colors.white,
                      );






                      // többi gomb


                    } else {
                      return MyButton(
                        buttonTapped: (){   // a parancs, ami megmondja, hogy mi történik, ha megnyomjuk a gombot
                          setState(() {
                            userQuestion += buttons[index]; // userQuestion = userQuestion + buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.amber[600]
                            : Colors.yellowAccent[100],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    };
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }

    // ha ezek közül bármelyik operátor, akkor sötétebb színe lesz a gombnak
}
