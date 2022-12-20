import 'package:flutter/material.dart';
import 'package:routepractice/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline1 : TextStyle(fontFamily: 'NotoSansKR', fontWeight: FontWeight.bold, fontSize: 30),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue, titleTextStyle: TextStyle(color: Colors.white)),
      ),
      home: IntroPage(),
    );
  }
}