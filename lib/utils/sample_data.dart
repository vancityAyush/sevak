import 'package:flutter/material.dart';
import 'package:sevak/controller/boolean_controller.dart';
import 'package:sevak/models/ApplyJobDetails.dart';
import 'package:sevak/models/message.dart';
import 'package:sevak/utils/enums.dart';

const jobCategories = [
  'Graphic Design',
  'UI/UX Designer',
  'Lead UX Designer',
  'Lead UI Designer',
  'Web Developer',
  'Senior Product Designer'
];

const misc =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

const QnA = [
  'What information do we collect about you?',
  "How do we use your information",
  "To Who do we disclose your information secure?",
  "Cookies, beacons and geo tracking"
];

List<JobDetails> sampleJobs = [
  for (var item in jobCategories)
    JobDetails(
      applyController: BooleanController(),
      bookmarkController: BooleanController(),
      address: 'B-1, Sector-1, Noida',
      experience: '2 Years',
      jobTime: JOBTIME.fulltime,
      title: item.toString(),
      salary: "80-90K",
      subtitle: "IJ Studio",
      qualifications: [misc, misc],
      skills: ["UI/UX", "Web Development"],
      image: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/IntelliJ_IDEA_Icon.svg/1200px-IntelliJ_IDEA_Icon.svg.png"),
    ),
  for (var item in jobCategories)
    JobDetails(
      applyController: BooleanController(),
      bookmarkController: BooleanController(),
      address: 'Bangalore',
      experience: '3 Years',
      jobTime: JOBTIME.parttime,
      title: item.toString(),
      salary: "1-3 Lakh",
      subtitle: "IJ Studio",
      image: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/IntelliJ_IDEA_Icon.svg/1200px-IntelliJ_IDEA_Icon.svg.png"),
    )
];

const profileOptions = [
  "Viewed Jobs",
  "Jobs Chat",
  "Sent Resume",
  "Saved Jobs"
];
const sample_users = [
  'Sumit',
  'Ayush',
  'Arjun',
  'Rakesh',
  'Sachin',
  'Saurabh',
  'Siddharth',
  'Mohit'
];

List<Message> sample_messages = [
  for (int i = 0; i < 10; i++)
    Message(
      data: i == 0 ? "Hi" : misc,
      isMe: i % 2 == 0 ? true : false,
      timestamp: DateTime.now(),
    )
];
