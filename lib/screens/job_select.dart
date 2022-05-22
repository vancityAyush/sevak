import 'package:flutter/material.dart';
import 'package:sevak/controller/boolean_controller.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/RadioContainer.dart';

class JobSelectPage extends StatefulWidget {
  const JobSelectPage({Key? key}) : super(key: key);

  @override
  State<JobSelectPage> createState() => _JobSelectPageState();
}

class _JobSelectPageState extends State<JobSelectPage> {
  EdgeInsets side_space = const EdgeInsets.symmetric(horizontal: 40);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              addVerticalSpace(60),
              Text(
                'What Job You want ?',
                style: TEXT_THEME_ACCENT.headline1,
              ),
              addVerticalSpace(40),
              Padding(
                padding: side_space,
                child: const Text(
                  'Choose 3-5 Job categories and we\'ll optimize the Job vacancy for you',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              addVerticalSpace(40),
              Expanded(
                child: ListView.builder(
                  padding: side_space,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: RadioContainer(
                      label: jobCategories[index],
                      controller: BooleanController(),
                    ),
                  ),
                  itemCount: jobCategories.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
