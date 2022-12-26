import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: '아이디를 입력하세요.',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(200, 200, 200, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0)),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                width: 20,
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '비밀번호를 입력하세요.',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(200, 200, 200, 1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                ),
              ),
              SizedBox(
                width: 20,
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('로그인'),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('회원가입'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
