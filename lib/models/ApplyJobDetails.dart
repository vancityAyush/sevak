import 'package:flutter/material.dart';
import 'package:sevak/controller/boolean_controller.dart';
import 'package:sevak/utils/enums.dart';

class JobDetails {
  final BooleanController? applyController;
  final BooleanController? bookmarkController;
  final String title;
  final String? salary;
  final String? subtitle;
  final Image? image;
  final String? address;
  final String? experience;
  final JOBTIME? jobTime;
  final List<String>? qualifications;
  final List<String>? skills;

  JobDetails({
    this.applyController,
    this.bookmarkController,
    required this.title,
    this.salary,
    this.subtitle,
    this.image,
    this.address,
    this.experience,
    this.jobTime,
    this.qualifications,
    this.skills,
  });
  void toggleApply() => applyController?.flip();
  bool get isApplied => applyController?.value ?? false;
  bool get isBookmarked => bookmarkController?.value ?? false;
}
