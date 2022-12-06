import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/network/providers/weather_provider.dart';

class PageCurrentWeather extends StatefulWidget {
  @override
  State<PageCurrentWeather> createState() => _PageCurrentWeatherState();
}

class _PageCurrentWeatherState extends State<PageCurrentWeather> {
  // változók deklarálása
  String cityName = "";
  String weatherName = "";
  String temperature = "";
  String icon = "01d";
  String date = "";
  String searchCityName = "Budapest";

  TextEditingController
      searchController = // keresőmezőből adatkinyerésre használt belépési pont
      TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
            'Időjárásjelentés alkalmazás'), // meghatározza az oldal/scaffold címét
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            width: 600,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(cityName,
                          // alább jelenítjük meg a városnév, időjárás, hőmérséklet, dátum, idő tényezőket és színüket
                          style: const TextStyle(color: Colors.white)),
                      // .name
                      Text(weatherName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 32.0)),
                      // .weather.description
                      Text(temperature,
                          style: const TextStyle(color: Colors.white)),
                      // .main.temp + C°
                      Image.network(
                          'https://openweathermap.org/img/w/$icon.png'),
                      // .weather.icon
                      Text(date, style: new TextStyle(color: Colors.white)),
                      Text(DateFormat.Hms().format(DateTime.now()),
                          style: new TextStyle(color: Colors.white)),
                      /*Row(
                          children: [*/
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.only(left: 8),
                        child: TextField(
                          // itt adjuk hozzá a keresőmezőt (fehér háttérrel és fekete-fekete) - városkereső felirattal
                          controller: searchController,
                          minLines: 1,
                          maxLines: 1,
                          style: TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: "Városkereső",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            // az alábbi függény segítségével ha a keresőbe beírjuk a kívánt városnevet, akkor annak az időjráás paramétereire keres majd rá
                            searchCityName = searchController.text;
                            refreshData();
                          },
                          icon: Icon(Icons.search), // kereső ikon (nagyító)
                          color: Colors.white,
                        ),
                      ), /*
                          ],
                        ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
          /*SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200.0,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Budapest',
                                      style:
                                          new TextStyle(color: Colors.black)),
                                  Text('Eső',
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 24.0)),
                                  Text('22°C',
                                      style:
                                          new TextStyle(color: Colors.black)),
                                  Image.network(
                                      'https://openweathermap.org/img/w/01d.png'),
                                  Text('Nov 3, 2021',
                                      style:
                                          new TextStyle(color: Colors.black)),
                                  Text('16:30',
                                      style:
                                          new TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            )*/
        ]),
      ),
    );
  }

  void refreshData() async {
    // az adatok frissítését ezzel érhetjük el
    var result = await WeatherProvider().getCityCurrentWeather(searchCityName);
    if (result != null) {
      setState(() {
        cityName = result.name ?? "Nan";
        if (result.weather?.isNotEmpty == true) {
          // lekérdezéls eredményében az időjárás lista nem üres-e
          var type = result.weather?.elementAt(0)?.description ?? "nan";
          weatherName = "${type[0].toUpperCase()}${type.substring(1)}";
          icon = result.weather?.elementAt(0)?.icon ?? "01d";
        }
        temperature = "${result.main?.temp ?? "Nan"} C°";
        var formatter = DateFormat('yyyy MMM dd');
        date = formatter.format(DateTime.fromMillisecondsSinceEpoch(
            (result.sys?.sunrise ?? DateTime.now().millisecondsSinceEpoch) *
                1000));
      });
    } else {
      print("NULL result");
    }
  }
}
