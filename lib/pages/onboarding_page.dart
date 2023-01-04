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
              body: '사랑하는 사람과 \n목표를 함께해요',
              image: Image.asset('assets/images/onboarding/friendship.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '즐거움',
              body: '열정을 함께하고,\n즐거움을 얻어요',
              image: Image.asset('assets/images/onboarding/passion.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '목표',
              body: '함께 원하던 \n미래를 만들어요',
              image: Image.asset('assets/images/onboarding/marriage.png'),
              decoration: getPageDecoration(),
            ),
          ],
          dotsDecorator: const DotsDecorator(
            size: Size(10,10),
            color: Colors.black12,
            activeColor: Colors.grey,
          ),
          curve: Curves.easeIn,
          showSkipButton: true,
          skip: const Text(
            '건너뛰기',
            style: TextStyle(fontSize: 10, fontFamily: 'NotoSansKR', color: Colors.blue),
          ),
          skipStyle: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          next: const Icon(Icons.arrow_forward, size: 20, color: Colors.grey,),
          nextStyle: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          done: const Text('시작해요', style: TextStyle(fontSize: 10, fontFamily: 'NotoSansKR', color: Colors.blue) ),
          doneStyle: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          onDone: () {
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      pageColor: Color.fromRGBO(255, 174, 201, 1),
      titleTextStyle: TextStyle(
          fontFamily: 'NotoSansKR', fontWeight: FontWeight.bold, fontSize: 20),
      imagePadding: EdgeInsets.only(top: 50),
    );
  }
}
