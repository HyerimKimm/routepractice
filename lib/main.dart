import 'package:flutter/material.dart';
import 'package:routepractice/pages/create_account_page.dart';
import 'package:routepractice/pages/login_page.dart';
import 'package:routepractice/pages/main_page.dart';
import 'package:routepractice/pages/onboarding_page.dart';

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
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                  shadows: <Shadow>[
                    Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 10.0,
                        color: Color.fromRGBO(255, 255, 255, 0.55))
                  ]),
              subtitle1: TextStyle(
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black
              ),
              subtitle2: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.black26
              ),
              bodyText1: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  color: Colors.black
              ),
              button: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white)),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            shadowColor: Colors.white38,
            iconTheme: IconThemeData(color: Colors.black54),
            centerTitle: true,
            elevation: 5,
            titleTextStyle: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              elevation: 10,
              shadowColor: Colors.white,
              minimumSize: Size(100, 15),
            ),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingPage(),
        '/login': (context) => const LoginPage(),
        '/createAccount': (context) => const CreateAccountPage(),
        '/main': (context) => const MainPage(),
        '/onboarding': (context) => const OnBoardingPage(),
      },
    );
  }
}