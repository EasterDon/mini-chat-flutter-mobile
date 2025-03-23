import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Widget loginButton = Text("登录", style: TextStyle(fontSize: 20));

    loginButton = GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, "/main");
      },
      child: Center(widthFactor: 2, child: loginButton),
    );

    loginButton = Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: loginButton,
    );

    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
            hintText: "账号",
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
            hintText: "密码",
          ),
        ),
        SizedBox(height: 20),
        loginButton,
      ],
    );

    body = FractionallySizedBox(widthFactor: 0.8, child: body);
    body = Center(child: body);
    body = Scaffold(body: body);

    return body;
  }
}
