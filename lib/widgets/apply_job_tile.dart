import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sevak/models/ApplyJobDetails.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/dotted_container.dart';

class ApplyJobTile extends StatelessWidget {
  final JobDetails job;
  const ApplyJobTile({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: DottedContainer(
        radius: 25,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: job.image,
              width: 40,
              height: 40,
            ),
            addHorizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    maxLines: 1,
                    style: TEXT_THEME_DEFAULT.headline2,
                  ),
                  Text(
                    job.subtitle ?? "",
                    style: TEXT_THEME_DEFAULT.bodyText1,
                  ),
                  addVerticalSpace(5),
                  Text(
                    "₹ ${job.salary}/ Year",
                    style: TEXT_THEME_DEFAULT.bodyText1,
                  ),
                ],
              ),
            ),
            Obx(
              () => MaterialButton(
                onPressed: () {
                  job.toggleApply();
                },
                minWidth: 100,
                color: COLOR_PURPLE,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  job.isApplied ? "Applied" : "Apply",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
