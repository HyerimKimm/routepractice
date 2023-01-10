import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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
        return SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.blue,
                      inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 10.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26)),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 12))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 45,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: '이름', hintText: '이름을 입력하세요.'),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            height: 45,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: '아이디', hintText: '아이디를 입력하세요.'),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            height: 45,
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: '비밀번호', hintText: '비밀번호를 입력하세요.'),
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
                            child: const Text(
                              '가입하기',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
