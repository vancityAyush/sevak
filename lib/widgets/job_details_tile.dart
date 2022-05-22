import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sevak/models/ApplyJobDetails.dart';
import 'package:sevak/screens/job_page.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/enums.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/dotted_container.dart';
import 'package:sevak/widgets/purple_container.dart';

class JobDetailsTile extends StatelessWidget {
  final JobDetails job;
  const JobDetailsTile({Key? key, required this.job}) : super(key: key);
  final EdgeInsets sides = const EdgeInsets.only(left: 30, right: 20);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(JobPage(job: job));
      },
      child: DottedContainer(
        radius: 20,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => ListTile(
                leading: job.image,
                title: Text(
                  job.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  job.subtitle ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    job.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: job.isBookmarked ? COLOR_PURPLE_DARK : COLOR_GREY,
                  ),
                  onPressed: () {
                    job.bookmarkController?.flip();
                  },
                ),
              ),
            ),
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: PurpleContainer(
                    color: COLOR_PURPLE,
                    border: 15,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      job.title,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Flexible(
                  child: PurpleContainer(
                    color: COLOR_PURPLE,
                    border: 15,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      job.jobTime == JOBTIME.fulltime
                          ? "Full Time"
                          : job.jobTime == JOBTIME.parttime
                              ? "Part Time"
                              : "Contract",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Flexible(
                  child: PurpleContainer(
                    color: COLOR_PURPLE,
                    border: 15,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "${job.experience} exp.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              horizontalTitleGap: 0,
              leading: const Icon(
                Icons.location_on,
                color: COLOR_PURPLE,
              ),
              title: Text(
                job.subtitle ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: COLOR_PURPLE,
                ),
              ),
              subtitle: Text(
                job.address ?? "",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              trailing: RichText(
                text: TextSpan(
                  text: "₹",
                  style: const TextStyle(
                    fontSize: 12,
                    color: COLOR_PURPLE,
                  ),
                  children: [
                    TextSpan(
                      text: " ${job.salary}/ Year",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
