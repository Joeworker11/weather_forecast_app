import 'package:flutter/material.dart';
import 'package:untitled1/pages/current_weather.dart';
import 'package:untitled1/pages/forecasted_weather.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Widget> pages =[PageCurrentWeather(), ForecastedWeather()];
  int index = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Weather App', // meghatározza az app címét
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (int actualIndex) {
            setState(() {
              index = actualIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Current"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_view_week), label: "Forecast"),
          ],
        ),

      ),

    );

  }
}
