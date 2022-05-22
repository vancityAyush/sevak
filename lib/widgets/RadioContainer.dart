import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sevak/controller/boolean_controller.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/widgets/dotted_container.dart';

class RadioContainer extends StatelessWidget {
  final BooleanController controller;
  final String label;
  const RadioContainer(
      {Key? key, required this.controller, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.flip(),
      child: Obx(
        () {
          return controller.value
              ? Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: COLOR_PURPLE,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : DottedContainer(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: COLOR_PURPLE,
                      fontSize: 20,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
