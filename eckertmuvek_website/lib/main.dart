import 'package:eckertmuvek_website/site_preferences.dart';
import 'package:flutter/material.dart';
import 'package:eckertmuvek_website/pages/homepage.dart';
import 'package:eckertmuvek_website/pages/introduction.dart';
import 'package:eckertmuvek_website/pages/references.dart';
import 'package:eckertmuvek_website/pages/contacts.dart';
import 'package:eckertmuvek_website/pages/for_new_visitors.dart';
import 'package:eckertmuvek_website/pages/rolling_shutter.dart';
import 'package:eckertmuvek_website/site_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
    );
  }
}
