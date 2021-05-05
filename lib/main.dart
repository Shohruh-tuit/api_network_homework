import 'package:api_netwok_homework/pages/details_page.dart';
import 'package:api_netwok_homework/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        DetailsPage.id: (context) => DetailsPage(),
      },
    );
  }
}
