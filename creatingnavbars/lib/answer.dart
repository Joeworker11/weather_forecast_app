import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(onPressed: null, child: Text("Red")),
          ElevatedButton(onPressed: null, child: Text("Yellow")),
          ElevatedButton(onPressed: null, child: Text("Green")),
          ElevatedButton(onPressed: null, child: Text("Blue")),
        ],
      ),
    );
  }
}


