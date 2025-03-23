import 'package:flutter/material.dart';
import 'package:mini_chat/views/main/main.dart';
import 'views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool init = false;

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
