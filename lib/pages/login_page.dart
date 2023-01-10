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
          '로그인',
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
                            inputDecorationTheme: const InputDecorationTheme(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                                SizedBox(
                                  width: 250,
                                  height: 45,
                                  child: TextFormField(
                                    controller: idController,
                                    decoration:
                                        InputDecoration(labelText: '아이디를 입력하세요.',),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              SizedBox(height: 10,),
                              SizedBox(
                                width: 250,
                                height: 45,
                                child: TextFormField(
                                  controller: pwController,
                                  decoration:
                                      InputDecoration(labelText: '비밀번호를 입력하세요.'),
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: Size(120.0, 40.0)),
                                    child: const Text(
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
                                      } else if (idController.text !=
                                              'couple' ||
                                          pwController.text != pwController) {
                                        showSnackBar(context, '로그인 정보를 확인하세요!');
                                      } else {
                                        //error
                                        showSnackBar(context, 'error');
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: Size(120.0, 40.0)),
                                    child: const Text(
                                      '회원가입',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/createAccount');
                                    },
                                  ),
                                ],
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
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.grey,
    ),
  );
}
