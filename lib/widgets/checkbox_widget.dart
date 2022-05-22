import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sevak/controller/boolean_controller.dart';

class CheckboxWidget extends StatelessWidget {
  final BooleanController controller;
  final Widget child;
  const CheckboxWidget(
      {Key? key, required this.controller, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.flip(),
      child: Obx(
        () {
          return Row(
            children: [
              Checkbox(
                value: controller.value,
                onChanged: (value) => controller.value = value ?? false,
              ),
              child,
            ],
          );
        },
      ),
    );
  }
}
