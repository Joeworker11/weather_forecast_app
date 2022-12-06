import 'package:flutter/material.dart';

void main() => runApp(new MyApp()); // ez lesz az app lelke

class MyApp extends StatelessWidget {
  // létrehozzuk a MyApp osztályt, hogy ne fusson hibára, a StatelessWidget minden olyanra értendő mint a (bg - ami nem változik)
  @override
  Widget build(BuildContext context) {                                        // a build metódus meghatározza, hogyan építsünk fel egy widgetet
    return new MaterialApp(
        title: "First app of mine", // app címe
        theme: ThemeData(primarySwatch: Colors.deepOrange), // alap háttér színe
        home: MyHomePage(
            title:
                "Hello app") // legelső oldal, ami bejön amikor betöltődik az app - annak a címe   // ctrl + alt + L --> kódsor automatikus formázása
        ); // a semicolonnal jelezzük, hogy ez az egész egy sor
  }
}

class MyHomePage extends StatefulWidget {
  // a myhomepage azért stateful widget mert itt fog minden akció és cselekmény végbemenni( változik)
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(); // ez az osztály fog szerepelni azért, hogy minden ami az UI-ban van lefusson és működjön futtatáskor
}

class _MyHomePageState extends State<MyHomePage> {
  // új osztály, ami a MyHomePageből származik le
  int _counter = 0; // számláló int létrehozása
  late int _counter2;

  void _incrementCounter() {
    setState(() {
      ++_counter;
      // megmondja mit csináljunk a függvényben
    });

  }
  void _minusCounter(){
    setState(() {
      --_counter;
    });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)), // belerakjuk a címeket
      body: Center(
        // centereljük középre
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // az oszlopon belül is betesszük középre
          children: <Widget>[
            // ráírjuk a gombra az írást
            Text("The button has been pressed: "),
            Text(
              "$_counter times.",
              style: TextStyle(fontSize: 30.0),
            ),
            // azért TextStyle mert így nagyobb betűméret lesz, mint a másik
          ],
        ),
      ),
      floatingActionButton: Padding(                                    // elkészítjük a gombhoz tartozó függvényt
        padding: const EdgeInsets.only(right: 24.0, bottom: 24.0),
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: "Increment",
          child: Icon(Icons.add),
        ), // margóktól való távolság beállítása
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 20),
        child: FloatingActionButtonMargin
      )
    ); // minden kód ebben lesz benne, amit külsőleg megakarunk majd jeleníteni     - ne felejtsük el kitenni a pontos vesszőt a Scaffold végére!
  }
}


