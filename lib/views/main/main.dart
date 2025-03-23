import 'package:flutter/material.dart';

import 'message.dart';
import 'conecter.dart';
import 'mine.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> views = [Message(), Conecter(), Mine()];

  @override
  Widget build(BuildContext context) {
    Widget bottomNavigator = BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "联系人"),
        BottomNavigationBarItem(icon: Icon(Icons.face), label: "我的"),
      ],
      onTap: (index) {
        setState(() => _currentIndex = index);
      },
      backgroundColor: Colors.white24,
    );

    bottomNavigator = Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: bottomNavigator,
    );

    Widget body = IndexedStack(index: _currentIndex, children: views);

    body = Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("主页"),
        centerTitle: true,
      ),
      body: body,
      bottomNavigationBar: bottomNavigator,
      resizeToAvoidBottomInset: false,
    );

    return body;
  }
}
