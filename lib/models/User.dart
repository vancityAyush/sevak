import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sevak/models/message.dart';

import '../utils/format.dart';

class User {
  final ImageProvider profileImage;
  final String name;
  final DateTime lastSeen;
  final List<Message> messages;
  late final RxList<Message> messagesController;

  User({
    required this.profileImage,
    required this.name,
    required this.lastSeen,
    required this.messages,
  }) {
    messagesController = messages.obs;
  }

  String get lastSeenTime => formatTime(lastSeen);
  String get lastSeenString =>
      DateTime.now().millisecond - lastSeen.millisecond < 50
          ? "Online"
          : 'Last seen $lastSeenTime';
  String get lastMessage => messages.last.data;
  bool doesHave(String search) =>
      name.toLowerCase().contains(search) ||
      messages.any(
        (message) => message.data.toLowerCase().contains(search),
      );

  void sendMessage(dynamic message) {
    if (message != null) {
      messages.add(
        Message(data: message, timestamp: DateTime.now(), isMe: true),
      );
      messagesController.add(
        Message(data: message, timestamp: DateTime.now(), isMe: true),
      );
    }
  }

  void receiveMessage(dynamic message) {
    if (message != null) {
      messages.add(
        Message(
          data: message,
          timestamp: DateTime.now(),
        ),
      );
      messagesController.add(
        Message(
          data: message,
          timestamp: DateTime.now(),
        ),
      );
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && name == other.name;
}
