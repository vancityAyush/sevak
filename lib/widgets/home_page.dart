import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/enums.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/dotted_container.dart';
import 'package:sevak/widgets/heading_subheading.dart';
import 'package:sevak/widgets/job_details_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  EdgeInsets sides = EdgeInsets.symmetric(horizontal: 24);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: COLOR_PURPLE,
                child: Padding(
                  padding: sides,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      addVerticalSpace(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.amber,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      RichText(
                        text: const TextSpan(
                          text: 'Find your\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          children: [
                            TextSpan(
                              text: 'Perfect Job',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVerticalSpace(30),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintText: 'Search By Position',
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          addHorizontalSpace(40),
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Icons.settings,
                                color: COLOR_PURPLE,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(
                                'Graphic Design',
                                style: const TextStyle(
                                  color: COLOR_PURPLE,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          addHorizontalSpace(20),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(
                                'Software Developer',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: COLOR_PURPLE,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(10),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      addVerticalSpace(30),
                      Padding(
                        padding: sides,
                        child: const HeadingSubheading(
                          title: "Popular Vacancies",
                          subtitle: "See more",
                        ),
                      ),
                      addVerticalSpace(20),
                      Padding(
                        padding: sides.copyWith(right: 0),
                        child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (var job in sampleJobs)
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                      maxHeight: 220,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    child: JobDetailsTile(
                                      job: job,
                                    ),
                                  )
                              ],
                            )),
                      ),
                      addVerticalSpace(30),
                      Padding(
                        padding: sides,
                        child: const HeadingSubheading(
                          title: "Recently Viewed",
                          subtitle: "See All",
                        ),
                      ),
                      addVerticalSpace(10),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: sides,
                        child: DottedContainer(
                          child: ListTile(
                            leading: SizedBox(
                              width: 30,
                              child: sampleJobs.first.image,
                            ),
                            title: Text(
                              sampleJobs.first.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "${sampleJobs.first.subtitle} ${getJobTime(sampleJobs.first.jobTime)}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Text(
                              "17 d left",
                              style: const TextStyle(
                                fontSize: 16,
                                color: COLOR_GREY,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
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
