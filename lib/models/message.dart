import 'package:flutter/material.dart';
import 'package:sevak/utils/format.dart';

class Message {
  final dynamic data;

  final bool isMe;
  final DateTime timestamp;

  Message({required this.data, this.isMe = false, required this.timestamp});

  bool isText() => data is String;
  bool isImage() => data is ImageProvider || data is Image;
  String getTime() {
    return formatTime(timestamp);
  }
}
