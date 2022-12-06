import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gyakorlás',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Gyakorlás'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(12.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  color: Colors.orangeAccent),
                child: Text('Bemutatkozás',
                  )


            ],
          )),
    );
  }
}
