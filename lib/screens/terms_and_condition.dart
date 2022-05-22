import 'package:flutter/material.dart';
import 'package:sevak/controller/boolean_controller.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/purple_container.dart';

import '../widgets/checkbox_widget.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);
  static const EdgeInsets side_space = EdgeInsets.symmetric(
    horizontal: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: COLOR_PURPLE_DARK,
        backgroundColor: Colors.transparent,
        leading: backButton2(context),
        title: const Text(
          'TERMS & CONDITION',
          style: TextStyle(
            color: COLOR_PURPLE_DARK,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Container(
            padding: side_space,
            margin: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                addVerticalSpace(40),
                const Text(
                  "Terms & Conditions",
                  style: TextStyle(
                    color: COLOR_PURPLE_DARK,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                addVerticalSpace(25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        misc,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      CheckboxWidget(
                        controller: BooleanController(),
                        child: const Text(
                          "I agree with the terms and conditions",
                        ),
                      ),
                      CheckboxWidget(
                        controller: BooleanController(),
                        child: const Text(
                          "I agree with quick Privacy Policy",
                        ),
                      ),
                      const PurpleContainer(
                        width: 150,
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                addVerticalSpace(25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
