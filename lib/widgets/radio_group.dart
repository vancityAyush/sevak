import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sevak/controller/radio_controller.dart';
import 'package:sevak/utils/constants.dart';

class RadioGroupWidget<T> extends StatelessWidget {
  RadioController<T> controller;
  String label;
  late Size size;
  final double sideWidth = 30; //from abbove state side spacing
  RadioGroupWidget({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          Obx(
            () => Row(
              children: [
                for (T item in controller.optionsList) getRadioButton(item)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getRadioButton(T value) {
    return SizedBox(
      width: (size.width - sideWidth - 40) / controller.optionsList.length,
      child: Row(
        children: [
          Radio<T>(
            value: controller.value,
            groupValue: value,
            onChanged: (_) => controller.onChange(value),
            activeColor: COLOR_PURPLE_DARK,
          ),
          Text(
            value is Enum ? value.toString().split('.')[1] : value.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
