import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _uname = TextEditingController();
  final TextEditingController _upass = TextEditingController();

  var url = Uri(
    scheme: "http",
    host: "10.0.2.2",
    path: "/mini-chat/auth/sign-in",
    port: 3000,
  );

  @override
  Widget build(BuildContext context) {
    Widget loginButton = Text("登录", style: TextStyle(fontSize: 20));

    loginButton = GestureDetector(
      onTap: () async {
        try {
          var res = await http.post(
            url,
            body: {"username": _uname.text, "password": _upass.text},
          );
          if (res.statusCode >= 300) {
            throw "请求出错";
          }
          var jsonRes = jsonDecode(res.body);
          var userProfile = jsonRes["profile"];
          final prefs = await SharedPreferences.getInstance();
          var value = jsonEncode({
            "profile": userProfile,
            "token": jsonRes["token"],
          });
          prefs.setString("user_value", value);
          // 检查当前 widget 是否仍然存在
          Navigator.pushReplacementNamed(context, "/main");
        } catch (error) {
          print(error);
        }
        //Navigator.pushReplacementNamed(context, "/main");
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
          controller: _uname,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
            hintText: "密码",
          ),
          controller: _upass,
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
