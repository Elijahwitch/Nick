import 'package:get/get.dart';

import 'package:flutter/material.dart';

class ChatController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxList<ChatMessage> _messages = <ChatMessage>[].obs;

  List<ChatMessage> get messages => _messages;

  void handleSubmitted(String text) {
    textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    _messages.insert(0, message);

    // Simulate a response from the bot after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      handleBotResponse();
    });
  }

  void handleBotResponse() {
    String response = "I'm a simple bot. You said something!";
    ChatMessage message = ChatMessage(
      text: response,
      isUser: false,
    );
    _messages.insert(0, message);
    update(); // Notify GetX to rebuild the UI
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(isUser ? 'User' : 'Bot')),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isUser ? 'You' : 'Bot',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
