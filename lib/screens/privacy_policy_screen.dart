import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/utils/widget_functions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);
  static const EdgeInsets side = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: backButton2(context),
      ),
      body: SafeArea(
        child: Container(
          padding: side,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PRIVACY POLICY",
                style: TEXT_THEME_ACCENT.headline3,
              ),
              addVerticalSpace(20),
              Text(
                misc,
                style: TEXT_THEME_DEFAULT.bodyText1,
              ),
              addVerticalSpace(50),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    color: COLOR_PURPLE_DARK,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    child: ExpansionTile(
                      title: Text(
                        QnA[index],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      trailing: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  itemCount: QnA.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
