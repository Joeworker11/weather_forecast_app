import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  var mainAxisAlignment;

  var crossAxisAlignment;

  get children => null;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Center(child: widget),
            ],
          ),
        ),
        appBar: AppBar(
            backgroundColor: currentWidth < 600
                ? Colors.deepOrange[50]
                : Colors.green[300], // a fejléc színe
            title: const Text('ECKERT MŰVEK KFT')),
        backgroundColor: Colors.cyan,
        // az oldal hátterének színe
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++;
            });
            ;
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Business",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "School",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.facebook),
              label: "Facebook",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tiktok),
              label: "Tiktok",
            ),
          ],
        ),
        drawer: Drawer(
          child: Text("Yo!"),
        ),
      ),
    );
  }
}
