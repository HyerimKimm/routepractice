import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: '함께 성장',
                body: '사랑하는 사람과 목표를 함께해요',
                image: Image.asset('assets/images/onboarding/friendship.png'),
                decoration: PageDecoration(),
            ),
            PageViewModel(
                title: '즐거움',
                body: '열정을 함께하고, 즐거움을 얻어요',
                image: Image.asset('assets/images/onboarding/passion.png')),
            PageViewModel(
                title: '목표',
                body: '사랑하는 사람과 꿈꾸던 미래를 만들어요',
                image: Image.asset('assets/images/onboarding/marriage.png')),
          ],
          done: const Text('시작해요'),
          onDone: () {
            Navigator.of(context).pushNamed('/login');
          },
          next: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }


}
