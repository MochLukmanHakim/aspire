import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MessageType { text, audio }

class Message {
  final String content;
  final bool isMine;
  final MessageType type;
  final DateTime timestamp;

  Message({
    required this.content,
    required this.isMine,
    required this.type,
    required this.timestamp,
  });
}

class ChatController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxList<Message> messages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialMessages();
  }

  void _loadInitialMessages() {
    messages.addAll([
      Message(
        content: 'Hi, Apakah Ada yang bisa dibantu',
        isMine: false,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      Message(
        content: 'lorem',
        isMine: true,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      ),
      Message(
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada',
        isMine: false,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
      Message(
        content: 'audio',
        isMine: false,
        type: MessageType.audio,
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      Message(
        content: 'audio',
        isMine: true,
        type: MessageType.audio,
        timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
      Message(
        content: 'Cihuyyyyyyyyy',
        isMine: true,
        type: MessageType.text,
        timestamp: DateTime.now(),
      ),
    ]);
  }

  void sendMessage() {
    if (textController.text.trim().isNotEmpty) {
      messages.add(Message(
        content: textController.text.trim(),
        isMine: true,
        type: MessageType.text,
        timestamp: DateTime.now(),
      ));
      textController.clear();
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}