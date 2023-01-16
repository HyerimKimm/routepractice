import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routepractice/utils/mybutton.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _authentication = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '회원가입',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Form(
                key: _formkey,
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.blue,
                      inputDecorationTheme: const InputDecorationTheme(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          errorStyle: TextStyle(fontSize: 8),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              height: 45,
                              child: TextFormField(
                                key: ValueKey('name'),
                                style: Theme.of(context).textTheme.bodyText1,
                                validator: (value) {
                                  if (value!.isEmpty) return '이름을 입력해 주세요!';
                                },
                                onSaved: (value) {
                                  userName = value!;
                                },
                                onChanged: (value) {
                                  userName = value;
                                },
                                decoration: const InputDecoration(
                                    hintText: '이름을 입력하세요.', hintStyle: TextStyle(fontSize: 10)),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 250,
                              height: 45,
                              child: TextFormField(
                                key: ValueKey('id'),
                                style: Theme.of(context).textTheme.bodyText1,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '이메일을 입력해 주세요!';
                                  }
                                },
                                onSaved: (value) {
                                  userEmail = value!;
                                },
                                onChanged: (value) {
                                  userEmail = value;
                                },
                                decoration:
                                    const InputDecoration(hintText: '이메일을 입력하세요.', hintStyle: TextStyle(fontSize: 10)),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 250,
                              height: 45,
                              child: TextFormField(
                                style: Theme.of(context).textTheme.bodyText1,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 6) {
                                    return '비밀번호는 6자 이상이어야 합니다!';
                                  }
                                },
                                onSaved: (value) {
                                  userPassword = value!;
                                },
                                onChanged: (value) {
                                  userPassword = value;
                                },
                                decoration:
                                    const InputDecoration(hintText: '비밀번호를 입력하세요.',hintStyle: TextStyle(fontSize: 10)),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            MyButton(
                                text: const Text('가입하기',
                                style: TextStyle(color: Colors.white)),
                                onPressed:() async {
                                  _tryValidation();

                                  try {
                                    final newUser = await _authentication
                                        .createUserWithEmailAndPassword(
                                      email: userEmail,
                                      password: userPassword,
                                    );

                                    if(newUser.user != null){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('가입 성공')),
                                      );
                                      Navigator.pop(context);
                                    }
                                  } catch (e) {
                                    print(e);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('사용할 수 없는 가입 정보입니다.')));
                                  }
                                },
                                widthSize: 200.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        );
      }),
    );
  }
}
