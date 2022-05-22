import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/route_manager.dart';
import 'package:sevak/screens/info_screen.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/dotted_container.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  OtpScreen({Key? key, this.phoneNumber = ""}) : super(key: key);
  String otp = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: backButton(context),
              ),
              addVerticalSpace(100),
              Padding(
                padding: side_padding,
                child: Text(
                  'Enter 4 digit verification code sent to your Number',
                  style: TEXT_THEME_ACCENT.headline1,
                ),
              ),
              addVerticalSpace(120),
              OtpTextField(
                onSubmit: (value) {
                  otp = value;
                },
                focusedBorderColor: COLOR_PURPLE,
                borderColor: COLOR_GREY,
                obscureText: true,
                showFieldAsBox: true,
                margin: side_padding,
                borderRadius: BorderRadius.circular(20),
              ),
              addVerticalSpace(100),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Resend code in 00:23',
                  style: TEXT_THEME_DEFAULT.headline4,
                ),
              ),
              addVerticalSpace(100),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {
                    Get.to(InformationScreen());
                  },
                  child: DottedContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Code Verify',
                          style: TEXT_THEME_ACCENT.headline4,
                        ),
                        doubleArrowIcon(),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
