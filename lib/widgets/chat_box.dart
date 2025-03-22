import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  final int id;
  final String chatBoxName;
  final String? lastMessageContent;
  final String? lastMessageTime;
  final int? chatBoxUnreadMessagesCount;
  final Color? backColor;
  final VoidCallback onTap;

  const ChatBox({
    super.key,
    required this.id,
    required this.chatBoxName,
    this.lastMessageContent,
    this.lastMessageTime,
    this.chatBoxUnreadMessagesCount,
    this.backColor = Colors.white,
    required this.onTap,
  });

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  late Color _backColor;

  void _setBackColor(bool active) {
    setState(() {
      _backColor = active ? Colors.red : widget.backColor!;
    });
  }

  void _delaySetBackColor(bool active) {
    Future.delayed(const Duration(milliseconds: 100), () {
      _setBackColor(active);
    });
  }

  @override
  void initState() {
    super.initState();
    _backColor = widget.backColor!;
  }

  @override
  Widget build(BuildContext context) {
    CircleAvatar avatar = CircleAvatar(
      backgroundImage: NetworkImage(
        "https://haowallpaper.com/link/common/file/getCroppingImg/15942630369381760",
      ),
      radius: 30,
    );

    Text chatBoxNameWidget = Text(
      widget.chatBoxName,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );

    Text chatBoxLastMessageContentWidget = Text(
      widget.lastMessageContent ?? "",
      style: TextStyle(fontSize: 14, color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    );

    Text chatBoxLastMessageTimeWidget = Text(
      widget.lastMessageTime ?? "",
      style: TextStyle(fontSize: 12, color: Colors.grey),
    );

    Text chatBoxUnreadMessagesCountWidget = Text("");

    if (widget.chatBoxUnreadMessagesCount != null) {
      chatBoxUnreadMessagesCountWidget =
          widget.chatBoxUnreadMessagesCount! > 99
              ? Text("99+")
              : Text(widget.chatBoxUnreadMessagesCount.toString());
    }

    Widget body = Row(
      children: [
        avatar,
        SizedBox(width: 15), // 添加间距
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [chatBoxNameWidget, chatBoxLastMessageContentWidget],
          ),
        ),
        SizedBox(
          width: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              chatBoxLastMessageTimeWidget,
              chatBoxUnreadMessagesCountWidget,
            ],
          ),
        ),
      ],
    );

    body = Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: body,
    );

    return GestureDetector(
      onTapDown: (e) {
        setState(() {
          _delaySetBackColor(true);
        });
      },
      onTapUp: (e) {
        setState(() {
          _delaySetBackColor(false);
        });
      },
      onTapCancel: () {
        setState(() {
          _delaySetBackColor(false);
        });
      },
      onTap: widget.onTap, // 调用父组件的点击回调
      child: Container(
        color: _backColor, // 根据点击状态改变颜色
        child: body,
      ),
    );
  }
}
