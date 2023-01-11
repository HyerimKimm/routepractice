import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _authentication = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  String userName = '';
  String userId = '';
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
                        padding: EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              height: 45,
                              child: TextFormField(
                                key: ValueKey('id'),
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
                                    hintText: '이름을 입력하세요.'),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 250,
                              height: 45,
                              child: TextFormField(
                                key: ValueKey('password'),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return '아이디는 4자 이상이어야 합니다!';
                                  }
                                },
                                onSaved: (value) {
                                  userId = value!;
                                },
                                onChanged: (value) {
                                  userId = value;
                                },
                                decoration:
                                    InputDecoration(hintText: '아이디를 입력하세요.'),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 250,
                              height: 45,
                              child: TextFormField(
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
                                    InputDecoration(hintText: '비밀번호를 입력하세요.'),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: const Size(200.0, 40.0),
                              ),
                              child: const Text('가입하기',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () async {
                                _tryValidation();

                                try {
                                  final newUser = await _authentication
                                      .createUserWithEmailAndPassword(
                                    email: userId,
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
                                      SnackBar(content: Text('error')));
                                }
                              },
                            ),
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
