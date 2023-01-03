import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white38,
          pages: [
            PageViewModel(
              title: '함께 성장',
              body: '사랑하는 사람과 \n목표를 함께해요',
              image: Image.asset('assets/images/onboarding/friendship.png'),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontFamily: Theme.of(context).textTheme.subtitle1?.fontFamily,
                  fontWeight: Theme.of(context).textTheme.subtitle1?.fontWeight,
                  fontSize: Theme.of(context).textTheme.subtitle1?.fontSize,
                ),
                imagePadding: EdgeInsets.only(top: 50),
              ),
            ),
            PageViewModel(
              title: '즐거움',
              body: '열정을 함께하고,\n즐거움을 얻어요',
              image: Image.asset('assets/images/onboarding/passion.png'),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontFamily: Theme.of(context).textTheme.subtitle1?.fontFamily,
                  fontWeight: Theme.of(context).textTheme.subtitle1?.fontWeight,
                  fontSize: Theme.of(context).textTheme.subtitle1?.fontSize,
                ),
                imagePadding: EdgeInsets.only(top: 50),
              ),
            ),
            PageViewModel(
              title: '목표',
              body: '사랑하는 사람과 \n세상을 정복해요',
              image: Image.asset('assets/images/onboarding/marriage.png'),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontFamily: Theme.of(context).textTheme.subtitle1?.fontFamily,
                  fontWeight: Theme.of(context).textTheme.subtitle1?.fontWeight,
                  fontSize: Theme.of(context).textTheme.subtitle1?.fontSize,
                ),
                imagePadding: EdgeInsets.only(top: 50),
              ),
            ),
          ],
          done: const Text('시작해요', style: TextStyle(fontSize: 10),),
          next: const Icon(Icons.arrow_forward, size: 20),
          onDone: () {
            Navigator.of(context).pushNamed('/login');
          },
        ),
        ),
    );
  }
}
