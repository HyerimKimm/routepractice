import 'package:flutter/material.dart';
import 'package:routepractice/pages/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text('인트로 페이지',style: Theme.of(context).textTheme.headline1,)),
            SizedBox(height: 5,),
            TextButton(
              child: Text('로그인하기'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute( builder: (context) => LoginPage() ));
              },
            )
          ],
        ),
      ),
    );
  }
}
