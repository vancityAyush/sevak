import 'package:flutter/material.dart';
import 'package:sevak/models/ApplyJobDetails.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/utils/widget_functions.dart';
import 'package:sevak/widgets/job_details_tile.dart';

class JobSearchPage extends StatefulWidget {
  JobSearchPage({Key? key}) : super(key: key);

  @override
  State<JobSearchPage> createState() => _JobSearchPageState();
}

class _JobSearchPageState extends State<JobSearchPage> {
  List<JobDetails> showingList = sampleJobs;
  List<JobDetails> originalList = sampleJobs;
  int currentCategoryIndex = 0;
  String query = "";
  TextEditingController _searchController = TextEditingController();
  EdgeInsets sides = const EdgeInsets.symmetric(horizontal: 40);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              child: Image(
                image: AssetImage("assets/logo.png"),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: sides,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 18,
                        color: COLOR_GREY,
                      ),
                      controller: _searchController,
                      onChanged: (value) {
                        setState(
                          () {
                            query = value.toLowerCase();
                          },
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: COLOR_GREY,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(
                                    () {
                                      query = "";
                                      showingList = originalList;
                                    },
                                  );
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  addHorizontalSpace(10),
                  Container(
                    decoration: BoxDecoration(
                      color: COLOR_PURPLE_DARK,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      color: COLOR_PURPLE_DARK,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            showingList = originalList
                                .where((element) =>
                                    element.title.toLowerCase().contains(query))
                                .toList();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(10),
            Padding(
              padding: sides,
              child: Text("${showingList.length} Job Opportunity Found"),
            ),
            addVerticalSpace(20),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 50,
              ),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) => addHorizontalSpace(20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    setState(
                      () {
                        currentCategoryIndex = index;
                        showingList = originalList
                            .where((element) =>
                                element.title == jobCategories[index])
                            .toList();
                      },
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: currentCategoryIndex == index
                          ? COLOR_PURPLE_DARK
                          : COLOR_GREY,
                    ),
                  ),
                  color: currentCategoryIndex == index
                      ? COLOR_PURPLE_DARK
                      : Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Center(
                    child: Text(
                      jobCategories[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: currentCategoryIndex == index
                            ? Colors.white
                            : COLOR_PURPLE_DARK,
                      ),
                    ),
                  ),
                ),
                itemCount: jobCategories.length,
              ),
            ),
            addVerticalSpace(30),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => addVerticalSpace(20),
                padding: sides,
                itemBuilder: (context, index) {
                  return JobDetailsTile(
                    job: showingList[index],
                  );
                },
                itemCount: showingList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
