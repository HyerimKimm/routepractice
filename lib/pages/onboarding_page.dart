import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return IntroductionScreen(
        pages: [
          PageViewModel(
              title: 'Welcome to my lovely app'
          ),
        ],
        done: const Text('done'),
        onDone: () {
          Navigator.of(context).pop(OnBoardingPage());
        },
      );
    });
  }
}
