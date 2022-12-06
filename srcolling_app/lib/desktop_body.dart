import 'package:flutter/material.dart';

class MyDesktopbody extends StatelessWidget {
  const MyDesktopbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        title: Text("D E S K T O P"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column( // első oszlop
                children: [
                  // youtube video rész
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        height: 120,
                        color: Colors.lightBlue[400],
                      ),
                    ),
                  ),
                  // komment szekció lenne
                  Expanded(
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 120,
                            color: Colors.lightBlue[400],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            // második oszlop
            Padding(padding: const EdgeInsets.all(8.0),
            child: Container(width: 360, color: Colors.lightBlue[400],
            ),
            )

          ],
        ),
      ),
    );
  }
}

