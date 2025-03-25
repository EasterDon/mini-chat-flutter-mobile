import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_chat/views/main/main.dart';
import 'views/login/login.dart';

Future<void> main() async {
  // 确保Flutter绑定初始化
  WidgetsFlutterBinding.ensureInitialized();


  bool init = false;
  final prefs = await SharedPreferences.getInstance();
  var value = prefs.getString("user_value");
  if (value != null) {
    var jsonValue = jsonDecode(value);
    if (jsonValue["token"] != null) init = true;
  }

  runApp(MyApp(init));
}

class MyApp extends StatelessWidget {
  final bool init;
  const MyApp(this.init, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget body = MaterialApp(
      title: '迷你通信',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      initialRoute: init ? "/main" : "/",
      routes: {"/": (context) => LoginPage(), "/main": (context) => MainPage()},
    );
    return body;
  }
}
