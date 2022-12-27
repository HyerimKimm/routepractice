import 'package:flutter/material.dart';
import 'package:routepractice/pages/create_account_page.dart';
import 'package:routepractice/pages/intro_page.dart';
import 'package:routepractice/pages/login_page.dart';
import 'package:routepractice/pages/main_page.dart';

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
        primaryColorLight: Colors.white,
        textTheme: TextTheme(
            headline1 : TextStyle(fontFamily: 'NotoSansKR', fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black ,),
            bodyText1 : TextStyle(fontFamily: 'NotoSansKR', fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black),
            button: TextStyle(fontFamily: 'NotoSansKR', fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white)
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          shadowColor: Colors.white38,
          iconTheme: IconThemeData(color: Colors.black54),
          centerTitle: true,
          elevation: 2,
          titleTextStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            minimumSize: Size(100,20)
          ),
        )
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>IntroPage(),
        '/login':(context)=>LoginPage(),
        '/createAccount' : (context)=>CreateAccountPage(),
        '/main' : (context)=>MainPage(),
      },
    );
  }
}