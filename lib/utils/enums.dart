enum GENDER {
  Male,
  Female;
}

enum EXPERIENCE {
  Experienced,
  Fresher;
}

enum JOBTIME {
  parttime,
  fulltime;
}

String getJobTime(JOBTIME? jobtime) {
  switch (jobtime) {
    case JOBTIME.fulltime:
      return "Full Time";
    case JOBTIME.parttime:
      return "Part Time";
    default:
      return "Contract";
  }
}
