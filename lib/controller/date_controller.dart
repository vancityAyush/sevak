import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  DateController({DateTime? date}) {
    dateTime = date == null ? DateTime.now().obs : date.obs;
    textController.addListener(updateTime);
    updateText();
  }

  late final Rx<DateTime> dateTime;
  DateTime get value => dateTime.value;
  final TextEditingController textController = TextEditingController();

  set value(DateTime value) {
    dateTime.value = value;
    updateText();
  }

  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  void updateTime() {
    try {
      dateTime.value = dateFormat.parse(textController.text);
    } catch (e) {}
  }

  void updateText() {
    textController.text = dateFormat.format(dateTime.value);
  }

  Future<void> pick(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateTime.value,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      value = picked;
    }
  }

  @override
  String toString() {
    return textController.text;
  }
}
