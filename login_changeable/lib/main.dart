import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_changeable/helper_widgets.dart';
import 'package:login_changeable/theme/theme_constants.dart';
import 'package:login_changeable/theme/theme_manager.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Practice',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_PRIMARY,//isDark?Color(COLOR_NIGHT):(COLOR_PRIMARY),//
        title: Text('Eckert Művek Kft.'),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                // csak akkor kapcsol be  switch on-ra ha darkon áll
                _themeManager.toggleTheme(
                    newValue); // azért kell bele a newValue mert a homescreen ugyanabban a fájlban van, mint a materialapp
              })
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Image.asset(
                  'assets/pinterest_profile_image.png',
                  width: 200,
                  height: 200,
                ),
                Text('Neved: ',
                    style: _textTheme.headline4?.copyWith(
                      color: isDark?Colors.white: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                addVerticalSpace(20),
                Text(
                  'Felhasználóneved: ',
                  style: _textTheme.subtitle1,
                ),
                addVerticalSpace(20),
                Text(
                    'Ez egy feliratkozás nélküli státusz',
                    style: TextStyle(fontSize: 16),
          ),
                addVerticalSpace(20),
                TextField(),
          // mező amibe betudunk írni
                addVerticalSpace(20),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Bejelentkezés',
              style: TextStyle(fontSize: 16),
            ),
          ),
          addVerticalSpace(10),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Kattints     ide',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ],
        ),
      ),
    ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.blue),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){

            },
          ),
        ) ,
    );
  }
}
