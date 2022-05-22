import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sevak/screens/otp_screen.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/dotted_container.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({Key? key}) : super(key: key);
  static const EdgeInsets side_space = EdgeInsets.symmetric(
    horizontal: 30,
  );
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(40),
              Container(
                margin: const EdgeInsets.all(60),
                child: Image.asset(
                  "assets/images/phone_screen_banner.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              addVerticalSpace(100),
              Padding(
                padding: side_space,
                child: Text(
                  "Enter Mobile Number",
                  style: TEXT_THEME_ACCENT.headline3,
                ),
              ),
              Padding(
                padding: side_space,
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    this.number = number;
                  },
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  hintText: "Enter your mobile number",
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              addVerticalSpace(80),
              Container(
                alignment: Alignment.center,
                margin: side_space,
                child: InkWell(
                  onTap: () {
                    Get.to(OtpScreen());
                  },
                  child: DottedContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next',
                          style: TEXT_THEME_ACCENT.bodyText1,
                        ),
                        doubleArrowIcon(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
