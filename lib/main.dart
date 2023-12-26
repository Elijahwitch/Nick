import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/chat_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: "Nicki's house",
      home: ChatScreen(),
    );
  }
}

void main() {
  const MyApp();
}
