// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupChatContainer extends StatefulWidget {
  const GroupChatContainer({super.key});

  @override
  State<GroupChatContainer> createState() => _GroupChatContainerState();
}

class _GroupChatContainerState extends State<GroupChatContainer> {
  final List<Map<String, dynamic>> _messages = [
    {
      "message": "Hey everyone! I'm at the beach bar! 🍹",
      "sender": "Sophia Williams",
      "time": "Jun 16 06:00 PM",
      "initials": "SW",
      "color": Colors.teal,
    },
    {
      "message": "On my way! Just getting ready",
      "sender": "Emma Johnson",
      "time": "Jun 16 06:02 PM",
      "initials": "EJ",
      "color": Colors.orange,
    },
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          "message": _controller.text,
          "sender": "Me",
          "time": "Jun 16 06:57 PM",
          "initials": "ME",
          "color": Colors.blue,
        });
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.w),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  message: _messages[index]["message"],
                  sender: _messages[index]["sender"],
                  time: _messages[index]["time"],
                  initials: _messages[index]["initials"],
                  color: _messages[index]["color"],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final String sender;
  final String time;
  final String initials;
  final Color color;

  const ChatBubble({
    super.key,
    required this.message,
    required this.sender,
    required this.time,
    required this.initials,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = sender == "Me";
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              backgroundColor: color,
              radius: 15.r,
              child: Text(
                initials,
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
            SizedBox(width: 10.w),
          ],
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: sender == "Sophia Williams"
                    ? Colors.pinkAccent
                    : sender == "Emma Johnson"
                        ? Colors.yellow[100]
                        : Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    sender,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Text(message),
                  Text(
                    time,
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          if (isMe) ...[
            SizedBox(width: 10.w),
            CircleAvatar(
              backgroundColor: color,
              radius: 15.r,
              child: Text(
                initials,
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
