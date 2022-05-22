import 'package:flutter/material.dart';
import 'package:sevak/controller/date_controller.dart';
import 'package:sevak/controller/radio_controller.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/enums.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/purple_container.dart';
import 'package:sevak/widgets/radio_group.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({Key? key, this.image}) : super(key: key);
  static const EdgeInsets side = EdgeInsets.symmetric(horizontal: 30);
  final _formKey = GlobalKey<FormState>();
  final ImageProvider? image;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DateController birthDateController = DateController();
  RadioController<GENDER> genderController =
      RadioController(options: GENDER.values);
  RadioController<EXPERIENCE> experienceController =
      RadioController(options: EXPERIENCE.values);
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  bool isValidPhone(String value) {
    String pattern = r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: backButton2(context),
        title: const Text(
          "Enter Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: side,
            width: size.width,
            height: size.height - 100,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Profile",
                        style: TEXT_THEME_ACCENT.headline3,
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO SELECT AND CHANGE IMAGE
                        },
                        child: image == null
                            ? const CircleAvatar(
                                backgroundColor: COLOR_GREY,
                                radius: 28,
                                child: CircleAvatar(
                                  radius: 26,
                                  backgroundColor: COLOR_WHITE,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: COLOR_GREY,
                                    size: 35,
                                  ),
                                ),
                              )
                            : Image(
                                image: image!,
                              ),
                      ),
                    ],
                  ),
                  addVerticalSpace(20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your first name";
                            }
                            return null;
                          },
                          controller: firstNameController,
                          decoration: const InputDecoration(
                            labelText: "First Name",
                          ),
                        ),
                      ),
                      addHorizontalSpace(20),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: "Last Name",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your last name";
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(20),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!isEmail(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  addVerticalSpace(20),
                  TextFormField(
                    controller: birthDateController.textController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Birthday",
                      labelStyle: const TextStyle(
                        fontSize: 24,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await birthDateController.pick(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: COLOR_GREY,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(30),
                  RadioGroupWidget<GENDER>(
                    label: "Gender",
                    controller: genderController,
                  ),
                  addVerticalSpace(20),
                  RadioGroupWidget<EXPERIENCE>(
                    label: "I am",
                    controller: experienceController,
                  ),
                  addVerticalSpace(20),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your phone number";
                      }
                      if (!isValidPhone(value)) {
                        return "Please enter a valid phone number";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Mobile",
                    ),
                  ),
                  Spacer(),
                  PurpleContainer(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        //TODO UPDATE DETAILS
                      }
                    },
                    child: const Text(
                      "Update Details",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
