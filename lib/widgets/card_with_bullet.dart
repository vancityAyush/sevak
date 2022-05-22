import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/widget_functions.dart';

class CardBullet extends StatelessWidget {
  final List<String> options;
  final String label;
  final double? fontSize;
  const CardBullet(
      {Key? key, required this.options, required this.label, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                label,
                style: TEXT_THEME_DEFAULT.headline4,
              ),
            ),
            addVerticalSpace(10),
            for (String item in options)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, top: 8),
                    child: Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 8,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item + "\n",
                      style: TextStyle(
                        fontSize: fontSize ?? 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
