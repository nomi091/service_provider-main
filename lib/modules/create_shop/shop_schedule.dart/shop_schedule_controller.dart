import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateShopScheduleControllerN extends GetxController {
  TextEditingController startTimecontroller = TextEditingController();
  TextEditingController endTimecontroller = TextEditingController();
  String dateTime = '';
  DateTime dateTimeDTS = DateTime(0);
  DateTime dateTimeDTE = DateTime(0);
  RxBool isShowTextField = false.obs;
  RxBool isConfirmButton = false.obs;

  double? heightofListviewOfMonday;
  double? heightofListviewOfTuesday;
  double? heightofListviewOfWednesday;
  double? heightofListviewOfThursday;
  double? heightofListviewOfFriday;
  double? heightofListviewOfSaturday;
  double? heightofListviewOfSunday;

  ///
  String openingTime = '';
  String closingTime = '';
  RxBool isMondaySwitched = true.obs;
  RxBool isTuesdaySwitched = true.obs;
  RxBool isWednesdaySwitched = true.obs;
  RxBool isThursdaySwitched = true.obs;
  RxBool isFridaySwitched = true.obs;
  RxBool isSaturdaySwitched = false.obs;
  RxBool isSundaySwitched = false.obs;
  List<TimeClass> mondayTimeList = [];
  List<TimeClassDT> mondayTimeListDT = [];
  List<TimeClass> tuesdayTimeList = [];
  List<TimeClassDT> tuesdayTimeListDT = [];
  List<TimeClass> wednesdayTimeList = [];
  List<TimeClassDT> wednesdayTimeListDT = [];
  List<TimeClass> thursdayTimeList = [];
  List<TimeClassDT> thursdayTimeListDT = [];
  List<TimeClass> fridayTimeList = [];
  List<TimeClassDT> fridayTimeListDT = [];
  List<TimeClass> saturdayTimeList = [];
  List<TimeClassDT> saturdayTimeListDT = [];
  List<TimeClass> sundayTimeList = [];
  List<TimeClassDT> sundayTimeListDT = [];
  List<ScheduleListItems> schedulesOfShop = [];
  String selectedShopDay = '';
  bool selectedDayShopIsOpen = false;
  List<TimeClass> selectedDaytimeShop = [];
}

class TimeClass {
  final String startTime;
  final String endTime;
  TimeClass(this.startTime, this.endTime);
}

class TimeClassDT {
  final String startTimeDT;
  final String endTimeDT;
  TimeClassDT(this.startTimeDT, this.endTimeDT);
}

class ScheduleListItems {
  final String day;
  final bool open;
  final List<TimeClass> shifts;
  ScheduleListItems(this.day, this.open, this.shifts);
}
