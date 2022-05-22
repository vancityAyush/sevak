import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/enums.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/card_with_bullet.dart';
import 'package:sevak/widgets/purple_container.dart';

import '../models/ApplyJobDetails.dart';

class JobPage extends StatelessWidget {
  final JobDetails job;
  const JobPage({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/job_banner.jpeg",
                      fit: BoxFit.cover,
                    ),
                    addVerticalSpace(20),
                    Obx(() => ListTile(
                          horizontalTitleGap: 5,
                          leading: SizedBox(
                            width: 40,
                            child: job.image,
                          ),
                          title: Text(
                            job.title,
                            style: TEXT_THEME_DEFAULT.headline1,
                          ),
                          subtitle: Text(
                            job.subtitle ?? "",
                            style: TEXT_THEME_DEFAULT.headline5,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              job.isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              size: 30,
                              color:
                                  job.isBookmarked ? COLOR_PURPLE : Colors.grey,
                            ),
                            onPressed: () {
                              job.bookmarkController?.flip();
                            },
                          ),
                        )),
                    Row(
                      children: [
                        addHorizontalSpace(20),
                        RichText(
                          text: TextSpan(
                            text: "₹ ",
                            style: const TextStyle(
                              color: COLOR_PURPLE,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: " ${job.salary}/ Year",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        PurpleContainer(
                          border: 20,
                          color: COLOR_PURPLE,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Text(
                            getJobTime(job.jobTime),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        PurpleContainer(
                          border: 20,
                          color: COLOR_PURPLE,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Text(
                            "${job.experience} exp.",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                    addVerticalSpace(20),
                    Divider(
                      thickness: 1,
                      color: COLOR_PURPLE_DARK.withOpacity(0.9),
                    ),
                    const TabBar(
                      indicatorColor: Colors.transparent,
                      labelColor: COLOR_PURPLE,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: 'Description'),
                        Tab(text: 'Company'),
                        Tab(text: 'Reviews'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              CardBullet(
                                  options: job.qualifications ?? [],
                                  label: "Qualifications"),
                              addVerticalSpace(20),
                              CardBullet(
                                options: job.skills ?? [],
                                label: "About The Job",
                                fontSize: 16,
                              ),
                              addVerticalSpace(100),
                            ],
                          ),
                          Container(
                            child: const Center(
                              child: Text('Company',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: const Text('Reviews',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpace(20),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Obx(
                  () => Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onSurface: Colors.black,
                          onPrimary: COLOR_PURPLE,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          job.bookmarkController?.flip();
                        },
                        child: Icon(
                          job.isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          size: 30,
                          color: COLOR_PURPLE,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:
                                job.isApplied ? Colors.white : COLOR_PURPLE,
                            onPrimary:
                                job.isApplied ? COLOR_PURPLE : Colors.white,
                            elevation: 0,
                            side: const BorderSide(
                              color: COLOR_PURPLE,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                          ),
                          onPressed: () {
                            job.applyController?.flip();
                          },
                          child: Text(
                            job.isApplied ? "Applied" : "Apply Now",
                            style: TextStyle(
                              color:
                                  job.isApplied ? COLOR_PURPLE : Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
