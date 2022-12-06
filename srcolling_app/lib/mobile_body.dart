import 'package:flutter/material.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        title: Text("M O B I L E"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // youtube video
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.blueAccent[400],
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
                        color: Colors.blueAccent[400],
                        height: 120,

                      ),
                    );
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
