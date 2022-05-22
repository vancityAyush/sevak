import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/widgets/apply_job_tile.dart';

class AppliedJobsPage extends StatelessWidget {
  const AppliedJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: COLOR_PURPLE_DARK,
          title: Hero(tag: "Applied Jobs", child: const Text('Applied Jobs')),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          itemBuilder: (context, index) {
            return ApplyJobTile(
              job: sampleJobs[index],
            );
          },
          itemCount: sampleJobs.length,
        ),
      ),
    );
  }
}
