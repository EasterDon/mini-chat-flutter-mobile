import 'package:flutter/material.dart';
import '/widgets/chat_box.dart';

class Message extends StatefulWidget {
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
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
      'lastMessageContent': '一会见！',
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

    return body;
  }
}
