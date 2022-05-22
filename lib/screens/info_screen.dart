import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/label_child.dart';
import 'package:sevak/widgets/label_field.dart';

class InformationScreen extends StatelessWidget {
  InformationScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _phoneController = TextEditingController();

  static const EdgeInsets side_space = EdgeInsets.symmetric(horizontal: 24);

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
              addVerticalSpace(40),
              Padding(
                padding: side_padding,
                child: Text(
                  'Your Information',
                  style: TEXT_THEME_ACCENT.headline1,
                ),
              ),
              addVerticalSpace(60),
              Container(
                padding: side_space,
                width: size.width,
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpace(20),
                      LabelAndField(
                        label: "Your Name",
                        hint: "Ayush",
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                      ),
                      LabelAndField(
                        label: "Email",
                        hint: "@gmail.com",
                        controller: _nameController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      LabelAndField(
                        label: "Phone Number",
                        hint: "+91-9856234756",
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      LabelAndChild(
                        label: "Gender",
                        child: Text("Nothing"),
                      )
                    ],
                  ),
                ),
              ),
              addVerticalSpace(80),
              Padding(
                padding: side_space,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: COLOR_PURPLE),
                      color: COLOR_PURPLE,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
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
