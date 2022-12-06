import 'package:flutter/material.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Asztali verzió'),
      ),
      body: Container(),
    );
    )
  }
}
