import 'package:flutter/material.dart';

import 'widgets/chat_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget body = MaterialApp(
      title: '迷你通信',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: const MyHomePage(title: '迷你通信'),
    );

    return body;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> chatItems = [
    {
      'id': 1,
      'chatBoxName': 'Chat 1',
      'lastMessageContent': 'Hello!',
      'lastMessageTime': '10:00 AM',
      'chatBoxUnreadMessagesCount': 2,
    },
    {
      'id': 2,
      'chatBoxName': 'Chat 2',
      'lastMessageContent': 'How are you?',
      'lastMessageTime': '11:00 AM',
      'chatBoxUnreadMessagesCount': 0,
    },
    {
      'id': 3,
      'chatBoxName': 'Chat 3',
      'lastMessageContent': 'See you later!',
      'lastMessageTime': '12:00 PM',
      'chatBoxUnreadMessagesCount': 5,
    },
  ];

  void _onChatBoxTap(int id) {
    print('Clicked on ChatBox with id: $id');
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemCount: chatItems.length,
      itemBuilder: (context, index) {
        final chatItem = chatItems[index];

        Widget chatBox = ChatBox(
          id: chatItem['id'],
          chatBoxName: chatItem['chatBoxName'],
          lastMessageContent: chatItem['lastMessageContent'],
          lastMessageTime: chatItem['lastMessageTime'],
          chatBoxUnreadMessagesCount: chatItem['chatBoxUnreadMessagesCount'],
          onTap: () => _onChatBoxTap(chatItem['id']), // 传递点击事件
        );

        chatBox = GestureDetector(
          onTapDown: (e) {
            setState(() {
              print(1);
            });
          },
          onTapUp: (e) {
            setState(() {
              print(2);
            });
          },
          onTapCancel: () {
            setState(() {
              print(3);
            });
          },
          child: chatBox,
        );

        return chatBox;
      },
    );

    Widget bottomNavigator = SizedBox(
      height: 80,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "联系人"),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: "我的"),
        ],
        onTap: (e) {
          print(e);
        },
        backgroundColor: Colors.white24,
      ),
    );

    body = Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: body,
      bottomNavigationBar: bottomNavigator,
      resizeToAvoidBottomInset: false,
    );

    return body;
  }
}
