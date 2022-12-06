import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;  // megnyomott gomb + hozzáadjuk a MyButtonhoz this.()

MyButton({this.color, this.textColor, required this.buttonText, this.buttonTapped});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(        // ez a gesztikulációért felel - gomb megnyomása
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(child: Text(buttonText, style: TextStyle(color: textColor, fontSize: 20),),),
          ),
        ),
      ),
    );
  }
}

