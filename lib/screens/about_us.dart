import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/utils/widget_functions.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  static const EdgeInsets side_space = EdgeInsets.symmetric(
    horizontal: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: COLOR_PURPLE_DARK,
        backgroundColor: Colors.transparent,
        leading: backButton2(context, color: COLOR_PURPLE_DARK),
        title: const Text(
          'ABOUT US',
          style: TextStyle(
            color: COLOR_PURPLE_DARK,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: side_space,
          margin: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: COLOR_PURPLE_DARK,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              addVerticalSpace(40),
              const Text(
                "Who we are,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              addVerticalSpace(25),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "$misc \n\n $misc \n",
                    style: TextStyle(
                      color: COLOR_GREY,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              addVerticalSpace(25),
            ],
          ),
        ),
      ),
    );
  }
}
