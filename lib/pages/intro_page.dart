import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:routepractice/pages/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/caffee.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Center(
                        child: Text(
                      '인트로 페이지',
                      style: Theme.of(context).textTheme.headline1,
                    )),
                  ],
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 45,
                    child: TextButton(
                      child: Text(
                        '로그인하기',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => LoginPage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
