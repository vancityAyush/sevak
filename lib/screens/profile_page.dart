import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sevak/screens/about_us.dart';
import 'package:sevak/screens/applied_jobs.dart';
import 'package:sevak/screens/phone_number_screen.dart';
import 'package:sevak/screens/privacy_policy_screen.dart';
import 'package:sevak/screens/terms_and_condition.dart';
import 'package:sevak/screens/user_details.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/utils/widget_functions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static EdgeInsets sidePadding = const EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              child: Container(
                color: COLOR_PURPLE_DARK,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        title: const Text(
                          "Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addVerticalSpace(40),
                        const CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 57,
                            backgroundColor: COLOR_PURPLE_DARK,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Ayush",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "9060842578",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              UserDetailsScreen(),
                              transition: Transition.downToUp,
                            );
                          },
                          child: DottedBorder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            color: Colors.white,
                            child: const Text(
                              "EDIT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(20),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        children: [
                          for (var item in profileOptions)
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    0.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: COLOR_PURPLE_DARK),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    item,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: COLOR_GREY),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: COLOR_GREY,
                    ),
                    addVerticalSpace(10),
                    Padding(
                      padding: sidePadding,
                      child: const Text(
                        "Profile Completion : ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: COLOR_PURPLE_DARK),
                      ),
                    ),
                    Padding(
                      padding: sidePadding,
                      child: LinearPercentIndicator(
                        percent: 0.4,
                        lineHeight: 15.0,
                        progressColor: COLOR_PURPLE_DARK,
                        center: const Text("40%",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        trailing: const Icon(
                          Icons.laptop_mac,
                          color: COLOR_PURPLE_DARK,
                          size: 50,
                        ),
                      ),
                    ),
                    ProfileTile(
                      sidePadding: sidePadding,
                      label: "Applied Jobs",
                      icon: Icons.fact_check_outlined,
                      page: AppliedJobsPage(),
                    ),
                    const DottedLine(
                      dashColor: COLOR_GREY,
                    ),
                    ProfileTile(
                      sidePadding: sidePadding,
                      label: "About Us",
                      icon: Icons.person,
                      page: AboutUsScreen(),
                    ),
                    const DottedLine(
                      dashColor: COLOR_GREY,
                    ),
                    ProfileTile(
                      sidePadding: sidePadding,
                      label: "Privacy & Policy",
                      icon: Icons.privacy_tip_outlined,
                      page: PrivacyPolicyScreen(),
                    ),
                    const DottedLine(
                      dashColor: COLOR_GREY,
                    ),
                    ProfileTile(
                      sidePadding: sidePadding,
                      label: "Terms & Conditions",
                      icon: Icons.file_copy_sharp,
                      page: TermsAndConditionScreen(),
                    ),
                    const DottedLine(
                      dashColor: COLOR_GREY,
                    ),
                    ProfileTile(
                      sidePadding: sidePadding,
                      label: "Sign Out",
                      icon: Icons.logout,
                      onTap: () {
                        Get.off(
                          PhoneNumberScreen(),
                          transition: Transition.downToUp,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final dynamic? page;
  final void Function()? onTap;
  ProfileTile(
      {Key? key,
      required this.label,
      required this.icon,
      this.page,
      this.onTap,
      required this.sidePadding})
      : super(key: key);

  final EdgeInsets sidePadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap == null
          ? Get.to(
              page,
              duration: Duration(milliseconds: 500),
              transition: Transition.downToUp,
            )
          : onTap!(),
      contentPadding: sidePadding,
      leading: Icon(
        icon,
        color: COLOR_PURPLE_DARK,
        size: 30,
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
