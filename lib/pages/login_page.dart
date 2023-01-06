import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 50)),
                Center(
                  child: const Image(
                    image: AssetImage('assets/images/orangemushroom.png'),
                    width: 170.0,
                    height: 190.0,
                  ),
                ),
                Form(
                    child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.blue,
                            inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 15.0,
                              ),
                            )),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: idController,
                                decoration:
                                    InputDecoration(labelText: '아이디를 입력하세요.'),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextField(
                                controller: pwController,
                                decoration:
                                    InputDecoration(labelText: '비밀번호를 입력하세요.'),
                                obscureText: true,
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: Size(100.0, 40.0)),
                                child: Text(
                                  '로그인',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (idController.text == 'couple' &&
                                      pwController.text == '1234') {
                                    //id, pw 맞음
                                    showSnackBar(context, '환영합니다!');
                                    Navigator.pushReplacementNamed(
                                        context, '/main');
                                  } else if (idController.text != 'couple' ||
                                      pwController.text != pwController) {
                                    showSnackBar(context, '로그인 정보를 확인하세요!');
                                  } else {
                                    //error
                                    showSnackBar(context, 'error');
                                  }
                                },
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.grey,
    ),
  );
}
