import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/mybutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authentication = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  String userEmail = '';
  String userPassword = '';

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
                                  style: Theme.of(context).textTheme.bodyText1,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      labelText: '이메일을 입력하세요.',
                                      labelStyle: TextStyle(fontSize: 10)),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 250,
                                height: 45,
                                child: TextFormField(
                                  style: Theme.of(context).textTheme.bodyText1,
                                  controller: pwController,
                                  decoration: InputDecoration(
                                      labelText: '비밀번호를 입력하세요.',
                                      labelStyle: TextStyle(fontSize: 10)),
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyButton(
                                      text: Text(
                                        '로그인',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        if (emailController.text.isEmpty) {
                                          showSnackBar(context, '이메일을 입력해주세요!');
                                        } else if (pwController.text.isEmpty) {
                                          showSnackBar(
                                              context, '비밀번호를 입력해주세요!');
                                        } else {
                                          try {
                                            final newUser =
                                                await _authentication
                                                    .signInWithEmailAndPassword(
                                                        email: userEmail,
                                                        password: userPassword);
                                            if (newUser.user != null) {
                                              final userEmail =
                                                  newUser.user!.email;
                                              showSnackBar(context,
                                                  '${userEmail}님 안녕하세요!');
                                              Navigator.pushReplacementNamed(
                                                  context, '/main');
                                            }
                                          } catch (e) {
                                            showSnackBar(
                                                context, '이메일, 비밀번호를 확인해주세요!');
                                          }
                                        }
                                      },
                                      widthSize: 120.0),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  MyButton(
                                    text: Text('회원가입'),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/createAccount');
                                    },
                                    widthSize: 120.0,
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
      content: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 8, fontFamily: 'NotoSansKR', color: Colors.white)),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey,
    ),
  );
}
