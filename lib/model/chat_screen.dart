import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  @override
  final ChatController controller = Get.put(ChatController());

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Nick'),
      ),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Obx(() {
              return ListView.builder(
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (_, index) => ChatMessage(
                  text: controller.messages[index].text,
                  isUser: controller.messages[index].isUser,
                ),
              );
            }),
          ),
          const Divider(height: 1.0),
          Container(
            decoration:
                const BoxDecoration(color: CupertinoColors.lightBackgroundGray),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: CupertinoColors.activeBlue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: CupertinoTextField(
                controller: controller.textController,
                onSubmitted: controller.handleSubmitted,
                placeholder: 'Send a message',
              ),
            ),
            CupertinoButton(
              child: const Icon(CupertinoIcons.arrow_right_circle),
              onPressed: () =>
                  controller.handleSubmitted(controller.textController.text),
            ),
          ],
        ),
      ),
    );
  }
}
