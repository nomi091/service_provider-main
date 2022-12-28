// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/create_shop/shop_schedule.dart/shop_schedule_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';

class CreatShopSchedulePage extends StatefulWidget {
  const CreatShopSchedulePage({Key? key}) : super(key: key);

  @override
  State<CreatShopSchedulePage> createState() => _CreatShopSchedulePageState();
}

class _CreatShopSchedulePageState extends State<CreatShopSchedulePage> {
  @override
  Widget build(BuildContext context) {
    CreateShopScheduleControllerN controller =
        Get.put(CreateShopScheduleControllerN());
    return Scaffold(
      backgroundColor: CustomTheme.colorF7F7F7,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.1,
                decoration: BoxDecoration(
                  color: CustomTheme.whiteColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: CustomTheme.color7E2242.withOpacity(0.10),
                      offset: const Offset(
                        0.0,
                        1.0,
                      ),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: Get.width * 0.85,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.mondayTimeList.clear();
                          controller.tuesdayTimeList.clear();
                          controller.wednesdayTimeList.clear();
                          controller.thursdayTimeList.clear();
                          controller.fridayTimeList.clear();
                          controller.saturdayTimeList.clear();
                          controller.sundayTimeList.clear();
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.05),
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.05),
                        child: Text(
                          'Schedule your time work',
                          style: TextStyle(
                              fontFamily: Constant.montserratSemiBold,
                              fontSize: 18,
                              color: CustomTheme.color232F34),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Monday
              ReuseableScheduleWidgetMonday(
                weekDay: 'Monday',
                isDivider: true,
                weekDayController: controller,
                isSwitchValue: false.obs,
                timeList: controller.mondayTimeList,
              ),
              // Tuesday
              ReuseableScheduleWidgetTuesday(
                weekDay: 'Tuesday',
                isDivider: true,
                weekDayController: controller,
                isSwitchValue: false.obs,
                timeList: controller.tuesdayTimeList,
              ),
              // Wednesday
              ReuseableScheduleWidgetWednesday(
                weekDay: 'Wednesday',
                isDivider: true,
                weekDayController: controller,
                isSwitchValue: false.obs,
                timeList: controller.wednesdayTimeList,
              ),
              // Thursday
              ReuseableScheduleWidgetTursday(
                weekDay: 'Thursday',
                isDivider: true,
                weekDayController: controller,
                isSwitchValue: false.obs,
                timeList: controller.thursdayTimeList,
              ),
              // Friday
              ReuseableScheduleWidgetFriday(
                weekDay: 'Friday',
                isDivider: true,
                weekDayController: controller,
                isSwitchValue: false.obs,
                timeList: controller.fridayTimeList,
              ),
              // Saturday
              ReuseableScheduleWidgetSaturday(
                weekDay: 'Saturday',
                isDivider: true,
                weekDayController: controller,
                isSwitchValue: false.obs,
                timeList: controller.saturdayTimeList,
              ),
              // Sunday
              ReuseableScheduleWidgetSunday(
                weekDay: 'Sunday',
                isDivider: true,
                weekDayController: controller,
                isSwitchValue: false.obs,
                timeList: controller.sundayTimeList,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.01, left: 20, right: 20),
                child: KAppButton(
                  buttonText: 'save'.tr,
                  buttonColor: CustomTheme.blackColor,
                  onTap: () {
                    Get.back();
                  },
                  textColor: CustomTheme.whiteColor,
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}

// Monday
class ReuseableScheduleWidgetMonday extends StatefulWidget {
  CreateShopScheduleControllerN weekDayController;
  final String weekDay;
  final bool isDivider;
  final RxBool isSwitchValue;
  final List<TimeClass> timeList;
  ReuseableScheduleWidgetMonday({
    Key? key,
    required this.weekDayController,
    required this.weekDay,
    required this.isDivider,
    required this.isSwitchValue,
    required this.timeList,
  }) : super(key: key);
  @override
  State<ReuseableScheduleWidgetMonday> createState() =>
      _ReuseableScheduleWidgetMondayState();
}

class _ReuseableScheduleWidgetMondayState
    extends State<ReuseableScheduleWidgetMonday> {
  int? length;
  @override
  void initState() {
    super.initState();
    length = widget.timeList.length;
    widget.weekDayController.heightofListviewOfMonday =
        (Get.height * 0) * length!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.weekDay,
                    style: TextStyle(
                        fontFamily: Constant.montserratSemiBold,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
                const Spacer(),
                SizedBox(
                    height: Get.height * 0.03,
                    width: Get.height * 0.03,
                    child: Switch(
                        activeTrackColor: CustomTheme.color707070,
                        activeColor: CustomTheme.color232F34,
                        inactiveThumbColor: CustomTheme.colorC7CACB,
                        onChanged: (val) {
                          setState(() {
                            setState(() {
                              widget.weekDayController.isMondaySwitched.value =
                                  !widget
                                      .weekDayController.isMondaySwitched.value;
                              if (widget.weekDayController.isMondaySwitched
                                      .value ==
                                  false) {
                                widget.weekDayController.isMondaySwitched
                                    .value = false;
                                widget.weekDayController.mondayTimeList.clear();
                                if (kDebugMode) {
                                  print(widget.weekDayController
                                      .isMondaySwitched.value);
                                  print(
                                      widget.weekDayController.mondayTimeList);
                                }
                              }
                              // widget.weekDayController.schedulesOfShop
                              //     .add(ScheduleListItems(
                              //         '1', // day ID
                              //         widget
                              //             .weekDayController // day on off
                              //             .isMondaySwitched
                              //             .value,
                              //         widget
                              //             .weekDayController // time
                              //             .mondayTimeList));
                            });
                          });
                        },
                        value:
                            widget.weekDayController.isMondaySwitched.value)),
              ],
            ),
            const SizedBox(height: 10),
            widget.weekDayController.isMondaySwitched.value
                ? SizedBox(
                    height: widget.weekDayController.heightofListviewOfMonday,
                    child: ListView.builder(
                      itemCount: widget.timeList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.20,
                                  height: 30,
                                  child: widget.timeList[index].startTime == ''
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            Text(
                                              widget.timeList[index].startTime,
                                              style: TextStyle(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                fontSize: 15,
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: Get.width * 0.18,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                widget.timeList[index].startTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 10,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: CustomTheme.color232F34,
                                          ),
                                        ),
                                      ),
                                widget.timeList[index].endTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: SizedBox(
                                          width: Get.width * 0.20,
                                          height: 30,
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.timeList[index].endTime,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  fontSize: 15,
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Container(
                                                width: Get.width * 0.18,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ));
                      },
                    ),
                  )
                : Text('Closed',
                    style: TextStyle(
                        fontFamily: Constant.montserratMedium,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
            Visibility(
              visible: widget.weekDayController.isMondaySwitched.value,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.weekDayController.startTimecontroller.clear();
                        widget.weekDayController.endTimecontroller.clear();
                        widget.weekDayController.dateTime = '';
                        widget.weekDayController.dateTimeDTS = DateTime(0);
                        widget.weekDayController.dateTimeDTE = DateTime(0);
                        widget.weekDayController.isConfirmButton.value = false;
                      });
                      datePicker(
                        context,
                        widget.weekDayController.startTimecontroller,
                        widget.weekDayController.endTimecontroller,
                        widget.weekDayController.dateTime,
                        widget.weekDayController.dateTimeDTS,
                        widget.weekDayController.dateTimeDTE,
                        widget.weekDayController.isShowTextField,
                        widget.weekDayController.isConfirmButton,
                        widget.weekDayController.mondayTimeList,
                        widget.weekDayController.mondayTimeListDT,
                      );
                    },
                    child: Text('+ Add Shift',
                        style: TextStyle(
                            fontFamily: Constant.montserratMedium,
                            fontSize: 15,
                            color: CustomTheme.color232F34))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.01),
                child: widget.isDivider
                    ? Divider(color: CustomTheme.color232F34.withOpacity(0.4))
                    : const SizedBox()
                //Text('Closed',
                // style: TextStyle(
                //   fontFamily: Constant.montserratMedium,
                //    fontSize: 15,
                ///    color: CustomTheme.color232F34)),
                )
          ],
        ));
  }

  void datePicker(
    BuildContext context,
    TextEditingController startTimecontroller,
    TextEditingController endTimecontroller,
    String dateTime,
    DateTime dateTimeDTS,
    DateTime dateTimeDTE,
    RxBool isShowTextField,
    RxBool isShowConfirm,
    List<TimeClass> timeList,
    List<TimeClassDT> timeListDT,
  ) {
    showCupertinoModalPopup(
        barrierColor: CustomTheme.blackColor.withOpacity(0.4),
        barrierDismissible: false,
        context: context,
        builder: (_) => Material(
              child: Container(
                color: CustomTheme.blackColor.withOpacity(0.4),
                height: Get.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3)),
                          color: CustomTheme.whiteColor,
                        ),
                        height: Get.height * 0.3,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: CupertinoDatePicker(
                            // maximumYear: 2016,
                            // minimumYear: 1950,
                            use24hFormat: false,
                            dateOrder: DatePickerDateOrder.mdy,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              debugPrint(val.toString());
                              if (startTimecontroller.text == '') {
                                dateTimeDTS = val;
                              } else {
                                dateTimeDTE = val;
                              }
                              setState(() {
                                String formattedTime =
                                    DateFormat.jm().format(val);

                                final a = formattedTime.split("-");
                                dateTime = a[0];
                                if (kDebugMode) {
                                  print(
                                      "------------------ $dateTime -------------------");
                                }
                              });
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3)),
                          color: CustomTheme.whiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isShowTextField.value = false;
                                Get.back();
                              },
                              child: SizedBox(
                                height: Get.height * 0.055,
                                width: Get.width * 0.3,
                                // decoration: BoxDecoration(
                                //     color: Colors.black,
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: Constant.montserratRegular,
                                      fontSize: 16,
                                      color: CustomTheme.color232F34,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Container(
                                width: Get.width * 0.001,
                                height: Get.height * 0.05,
                                color: CustomTheme.color232F34),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Obx(() {
                              return InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                        "Enter in func +++++++++++++++++++++++++");
                                  }
                                  if (isShowConfirm.value) {
                                    // if (timeList[0].startTime == '' &&
                                    //     timeList[0].endTime == '') {
                                    //   timeList.clear();
                                    //   timeListDT.clear();
                                    // }
                                    // if first time slot is going to add
                                    if (timeList.isEmpty) {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfMonday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      Get.back();
                                    } else {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      // if same time already exist
                                      for (int i = 0;
                                          i < timeList.length;
                                          i++) {
                                        // if start time is already in list
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) ||
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) &&
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }
                                      // if select time between added slot
                                      // if start time is smaller then end time
                                      for (int i = 0;
                                          i < timeListDT.length;
                                          i++) {
                                        DateTime startListDate = DateTime.parse(
                                            timeListDT[i].startTimeDT);
                                        DateTime endListDate = DateTime.parse(
                                            timeListDT[i].endTimeDT);
                                        // if select time between added slot
                                        if (dateTimeDTS
                                                .isAfter(startListDate) &&
                                            dateTimeDTS.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (dateTimeDTE
                                                .isAfter(startListDate) &&
                                            dateTimeDTE.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        // if start time is smaller then end time
                                        if (dateTimeDTS.isAfter(dateTimeDTE)) {
                                          Get.snackbar('Error',
                                              'The selected time is invalid');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }

                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfMonday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      if (kDebugMode) {
                                        print(
                                            'Time List of Date time $timeListDT');
                                      }
                                      Get.back();
                                    }
                                  } else {
                                    if (startTimecontroller.text.isEmpty) {
                                      if (dateTime == '') {
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++ -- $dateTime");
                                        }
                                        String formattedTime = DateFormat.jm()
                                            .format(DateTime.now());
                                        dateTime = formattedTime;
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++$dateTime");
                                        }
                                        startTimecontroller.text =
                                            formattedTime;
                                        isShowTextField.value = true;
                                      } else {
                                        setState(() {
                                          startTimecontroller.text =
                                              dateTime.toString();
                                          isShowTextField.value = true;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        endTimecontroller.text =
                                            dateTime.toString();
                                        isShowConfirm.value = true;
                                      });
                                    }
                                  }
                                },
                                child: SizedBox(
                                  height: Get.height * 0.055,
                                  width: Get.width * 0.3,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.black,
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(
                                      !isShowConfirm.value ? 'Ok' : 'Confirm',
                                      style: TextStyle(
                                          fontFamily:
                                              Constant.montserratRegular,
                                          fontSize: 16,
                                          color: CustomTheme.color232F34),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: Get.width * 0.005,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Obx(() {
                          return isShowTextField.value != true
                              ? const SizedBox()
                              : SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Start Time',
                                            style: TextStyle(
                                              fontFamily:
                                                  Constant.montserratBold,
                                              fontSize: 18,
                                              color: CustomTheme.blackColor,
                                            ),
                                          ),
                                          Container(
                                            height: Get.height * 0.055,
                                            width: Get.width * 0.3,
                                            decoration: BoxDecoration(
                                                // color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: Get.width * 0.03),
                                              child: Center(
                                                child: TextField(
                                                  controller:
                                                      startTimecontroller,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constant.montserratBold,
                                                    fontSize: 18,
                                                    color:
                                                        CustomTheme.blackColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.1,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'End Time',
                                            style: TextStyle(
                                              fontFamily:
                                                  Constant.montserratBold,
                                              fontSize: 18,
                                              color: CustomTheme.blackColor,
                                            ),
                                          ),
                                          Container(
                                            height: Get.height * 0.055,
                                            width: Get.width * 0.3,
                                            decoration: BoxDecoration(
                                                // color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: Get.width * 0.03),
                                              child: Center(
                                                child: TextField(
                                                  controller: endTimecontroller,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constant.montserratBold,
                                                    fontSize: 18,
                                                    color:
                                                        CustomTheme.blackColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.005,
                                      ),
                                    ],
                                  ),
                                );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}

// Tuesday
class ReuseableScheduleWidgetTuesday extends StatefulWidget {
  CreateShopScheduleControllerN weekDayController;
  final String weekDay;
  final bool isDivider;
  final RxBool isSwitchValue;
  final List<TimeClass> timeList;
  ReuseableScheduleWidgetTuesday({
    Key? key,
    required this.weekDayController,
    required this.weekDay,
    required this.isDivider,
    required this.isSwitchValue,
    required this.timeList,
  }) : super(key: key);
  @override
  State<ReuseableScheduleWidgetTuesday> createState() =>
      _ReuseableScheduleWidgetTuesdayState();
}

class _ReuseableScheduleWidgetTuesdayState
    extends State<ReuseableScheduleWidgetTuesday> {
  int? length;
  @override
  void initState() {
    super.initState();
    length = widget.timeList.length;
    widget.weekDayController.heightofListviewOfTuesday =
        (Get.height * 0) * length!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.weekDay,
                    style: TextStyle(
                        fontFamily: Constant.montserratSemiBold,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
                const Spacer(),
                SizedBox(
                    height: Get.height * 0.03,
                    width: Get.height * 0.03,
                    child: Switch(
                        activeTrackColor: CustomTheme.color707070,
                        activeColor: CustomTheme.color232F34,
                        inactiveThumbColor: CustomTheme.colorC7CACB,
                        onChanged: (val) {
                          setState(() {
                            setState(() {
                              widget.weekDayController.isTuesdaySwitched.value =
                                  !widget.weekDayController.isTuesdaySwitched
                                      .value;
                              if (widget.weekDayController.isTuesdaySwitched
                                      .value ==
                                  false) {
                                widget.weekDayController.isTuesdaySwitched
                                    .value = false;
                                widget.weekDayController.tuesdayTimeList
                                    .clear();
                                if (kDebugMode) {
                                  print(widget.weekDayController
                                      .isTuesdaySwitched.value);
                                  print(
                                      widget.weekDayController.tuesdayTimeList);
                                }
                              }
                              // widget.weekDayController.schedulesOfShop
                              //     .add(ScheduleListItems(
                              //         '2', // day ID
                              //         widget
                              //             .weekDayController // day on off
                              //             .isTuesdaySwitched
                              //             .value,
                              //         widget
                              //             .weekDayController // time
                              //             .tuesdayTimeList));
                            });
                          });
                        },
                        value:
                            widget.weekDayController.isTuesdaySwitched.value)),
              ],
            ),
            const SizedBox(height: 10),
            widget.weekDayController.isTuesdaySwitched.value
                ? SizedBox(
                    height: widget.weekDayController.heightofListviewOfTuesday,
                    child: ListView.builder(
                      itemCount: widget.timeList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.18,
                                  height: 30,
                                  child: widget.timeList[index].startTime == ''
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            Text(
                                              widget.timeList[index].startTime,
                                              style: TextStyle(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                fontSize: 15,
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: Get.width * 0.18,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                widget.timeList[index].startTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 10,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: CustomTheme.color232F34,
                                          ),
                                        ),
                                      ),
                                widget.timeList[index].endTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: SizedBox(
                                          width: Get.width * 0.18,
                                          height: 30,
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.timeList[index].endTime,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  fontSize: 15,
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Container(
                                                width: Get.width * 0.18,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ));
                      },
                    ),
                  )
                : Text('Closed',
                    style: TextStyle(
                        fontFamily: Constant.montserratMedium,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
            Visibility(
              visible: widget.weekDayController.isTuesdaySwitched.value,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.weekDayController.startTimecontroller.clear();
                        widget.weekDayController.endTimecontroller.clear();
                        widget.weekDayController.dateTime = '';
                        widget.weekDayController.dateTimeDTS = DateTime(0);
                        widget.weekDayController.dateTimeDTE = DateTime(0);
                        widget.weekDayController.isConfirmButton.value = false;
                      });
                      datePicker(
                        context,
                        widget.weekDayController.startTimecontroller,
                        widget.weekDayController.endTimecontroller,
                        widget.weekDayController.dateTime,
                        widget.weekDayController.dateTimeDTS,
                        widget.weekDayController.dateTimeDTE,
                        widget.weekDayController.isShowTextField,
                        widget.weekDayController.isConfirmButton,
                        widget.weekDayController.tuesdayTimeList,
                        widget.weekDayController.tuesdayTimeListDT,
                      );
                    },
                    child: Text('+ Add Shift',
                        style: TextStyle(
                            fontFamily: Constant.montserratMedium,
                            fontSize: 15,
                            color: CustomTheme.color232F34))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.01),
                child: widget.isDivider
                    ? Divider(color: CustomTheme.color232F34.withOpacity(0.4))
                    : const SizedBox()
                //Text('Closed',
                // style: TextStyle(
                //   fontFamily: Constant.montserratMedium,
                //    fontSize: 15,
                ///    color: CustomTheme.color232F34)),
                )
          ],
        ));
  }

  void datePicker(
    BuildContext context,
    TextEditingController startTimecontroller,
    TextEditingController endTimecontroller,
    String dateTime,
    DateTime dateTimeDTS,
    DateTime dateTimeDTE,
    RxBool isShowTextField,
    RxBool isShowConfirm,
    List<TimeClass> timeList,
    List<TimeClassDT> timeListDT,
  ) {
    showCupertinoModalPopup(
        barrierColor: CustomTheme.blackColor.withOpacity(0.4),
        barrierDismissible: false,
        context: context,
        builder: (_) => Material(
              child: Container(
                height: Get.height * 0.7,
                color: CustomTheme.blackColor.withOpacity(0.4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3)),
                          color: CustomTheme.primaryColor,
                        ),
                        height: Get.height * 0.3,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: CupertinoDatePicker(
                            // maximumYear: 2016,
                            // minimumYear: 1950,
                            use24hFormat: false,
                            dateOrder: DatePickerDateOrder.mdy,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              debugPrint(val.toString());
                              if (startTimecontroller.text == '') {
                                dateTimeDTS = val;
                              } else {
                                dateTimeDTE = val;
                              }
                              setState(() {
                                String formattedTime =
                                    DateFormat.jm().format(val);

                                final a = formattedTime.split("-");
                                dateTime = a[0];
                                if (kDebugMode) {
                                  print(
                                      "------------------ $dateTime -------------------");
                                }
                              });
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3)),
                          color: CustomTheme.whiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isShowTextField.value = false;
                                Get.back();
                              },
                              child: SizedBox(
                                height: Get.height * 0.055,
                                width: Get.width * 0.3,
                                // decoration: BoxDecoration(
                                //     color: Colors.black,
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: Constant.montserratRegular,
                                      fontSize: 16,
                                      color: CustomTheme.color232F34,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Container(
                                width: Get.width * 0.001,
                                height: Get.height * 0.05,
                                color: CustomTheme.color232F34),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Obx(() {
                              return InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                        "Enter in func +++++++++++++++++++++++++");
                                  }
                                  if (isShowConfirm.value) {
                                    // if (timeList[0].startTime == '' &&
                                    //     timeList[0].endTime == '') {
                                    //   timeList.clear();
                                    //   timeListDT.clear();
                                    // }
                                    // if first time slot is going to add
                                    if (timeList.isEmpty) {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfTuesday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      Get.back();
                                    } else {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      // if same time already exist
                                      for (int i = 0;
                                          i < timeList.length;
                                          i++) {
                                        // if start time is already in list
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) ||
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) &&
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }
                                      // if select time between added slot
                                      // if start time is smaller then end time
                                      for (int i = 0;
                                          i < timeListDT.length;
                                          i++) {
                                        DateTime startListDate = DateTime.parse(
                                            timeListDT[i].startTimeDT);
                                        DateTime endListDate = DateTime.parse(
                                            timeListDT[i].endTimeDT);
                                        // if select time between added slot
                                        if (dateTimeDTS
                                                .isAfter(startListDate) &&
                                            dateTimeDTS.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (dateTimeDTE
                                                .isAfter(startListDate) &&
                                            dateTimeDTE.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        // if start time is smaller then end time
                                        if (dateTimeDTS.isAfter(dateTimeDTE)) {
                                          Get.snackbar('Error',
                                              'The selected time is invalid');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }

                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfTuesday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      if (kDebugMode) {
                                        print(
                                            'Time List of Date time $timeListDT');
                                      }
                                      Get.back();
                                    }
                                  } else {
                                    if (startTimecontroller.text.isEmpty) {
                                      if (dateTime == '') {
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++ -- $dateTime");
                                        }
                                        String formattedTime = DateFormat.jm()
                                            .format(DateTime.now());
                                        dateTime = formattedTime;
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++$dateTime");
                                        }
                                        startTimecontroller.text =
                                            formattedTime;
                                        isShowTextField.value = true;
                                      } else {
                                        setState(() {
                                          startTimecontroller.text =
                                              dateTime.toString();
                                          isShowTextField.value = true;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        endTimecontroller.text =
                                            dateTime.toString();
                                        isShowConfirm.value = true;
                                      });
                                    }
                                  }
                                },
                                child: SizedBox(
                                  height: Get.height * 0.055,
                                  width: Get.width * 0.3,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.black,
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(
                                      !isShowConfirm.value ? 'Ok' : 'Confirm',
                                      style: TextStyle(
                                        fontFamily: Constant.montserratRegular,
                                        fontSize: 16,
                                        color: CustomTheme.color232F34,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: Get.width * 0.005,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Obx(() {
                        return isShowTextField.value != true
                            ? const SizedBox()
                            : SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Start Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: startTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'End Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: endTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.005,
                                    ),
                                  ],
                                ),
                              );
                      })
                    ],
                  ),
                ),
              ),
            ));
  }
}

// WednesDay
class ReuseableScheduleWidgetWednesday extends StatefulWidget {
  CreateShopScheduleControllerN weekDayController;
  final String weekDay;
  final bool isDivider;
  final RxBool isSwitchValue;
  final List<TimeClass> timeList;
  ReuseableScheduleWidgetWednesday({
    Key? key,
    required this.weekDayController,
    required this.weekDay,
    required this.isDivider,
    required this.isSwitchValue,
    required this.timeList,
  }) : super(key: key);
  @override
  State<ReuseableScheduleWidgetWednesday> createState() =>
      _ReuseableScheduleWidgetWednesdayState();
}

class _ReuseableScheduleWidgetWednesdayState
    extends State<ReuseableScheduleWidgetWednesday> {
  int? length;
  @override
  void initState() {
    super.initState();
    length = widget.timeList.length;
    widget.weekDayController.heightofListviewOfWednesday =
        (Get.height * 0) * length!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.weekDay,
                    style: TextStyle(
                        fontFamily: Constant.montserratSemiBold,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
                const Spacer(),
                SizedBox(
                    height: Get.height * 0.03,
                    width: Get.height * 0.03,
                    child: Switch(
                        activeTrackColor: CustomTheme.color707070,
                        activeColor: CustomTheme.color232F34,
                        inactiveThumbColor: CustomTheme.colorC7CACB,
                        onChanged: (val) {
                          setState(() {
                            setState(() {
                              widget.weekDayController.isWednesdaySwitched
                                      .value =
                                  !widget.weekDayController.isWednesdaySwitched
                                      .value;
                              if (widget.weekDayController.isWednesdaySwitched
                                      .value ==
                                  false) {
                                widget.weekDayController.isWednesdaySwitched
                                    .value = false;
                                widget.weekDayController.wednesdayTimeList
                                    .clear();
                                if (kDebugMode) {
                                  print(widget.weekDayController
                                      .isWednesdaySwitched.value);
                                  print(widget
                                      .weekDayController.wednesdayTimeList);
                                }
                              }
                              // widget.weekDayController.schedulesOfShop
                              //     .add(ScheduleListItems(
                              //         '3', // day ID
                              //         widget
                              //             .weekDayController // day on off
                              //             .isWednesdaySwitched
                              //             .value,
                              //         widget
                              //             .weekDayController // time
                              //             .wednesdayTimeList));
                            });
                          });
                        },
                        value: widget
                            .weekDayController.isWednesdaySwitched.value)),
              ],
            ),
            const SizedBox(height: 10),
            widget.weekDayController.isWednesdaySwitched.value
                ? SizedBox(
                    height:
                        widget.weekDayController.heightofListviewOfWednesday,
                    child: ListView.builder(
                      itemCount: widget.timeList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.18,
                                  height: 30,
                                  child: widget.timeList[index].startTime == ''
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            Text(
                                              widget.timeList[index].startTime,
                                              style: TextStyle(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                fontSize: 15,
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: Get.width * 0.18,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                widget.timeList[index].startTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 10,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: CustomTheme.color232F34,
                                          ),
                                        ),
                                      ),
                                widget.timeList[index].endTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: SizedBox(
                                          width: Get.width * 0.18,
                                          height: 30,
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.timeList[index].endTime,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  fontSize: 15,
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Container(
                                                width: Get.width * 0.18,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ));
                      },
                    ),
                  )
                : Text('Closed',
                    style: TextStyle(
                        fontFamily: Constant.montserratMedium,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
            Visibility(
              visible: widget.weekDayController.isWednesdaySwitched.value,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.weekDayController.startTimecontroller.clear();
                        widget.weekDayController.endTimecontroller.clear();
                        widget.weekDayController.dateTime = '';
                        widget.weekDayController.dateTimeDTS = DateTime(0);
                        widget.weekDayController.dateTimeDTE = DateTime(0);
                        widget.weekDayController.isConfirmButton.value = false;
                      });
                      datePicker(
                        context,
                        widget.weekDayController.startTimecontroller,
                        widget.weekDayController.endTimecontroller,
                        widget.weekDayController.dateTime,
                        widget.weekDayController.dateTimeDTS,
                        widget.weekDayController.dateTimeDTE,
                        widget.weekDayController.isShowTextField,
                        widget.weekDayController.isConfirmButton,
                        widget.weekDayController.wednesdayTimeList,
                        widget.weekDayController.wednesdayTimeListDT,
                      );
                    },
                    child: Text('+ Add Shift',
                        style: TextStyle(
                            fontFamily: Constant.montserratMedium,
                            fontSize: 15,
                            color: CustomTheme.color232F34))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.01),
                child: widget.isDivider
                    ? Divider(color: CustomTheme.color232F34.withOpacity(0.4))
                    : const SizedBox()
                //Text('Closed',
                // style: TextStyle(
                //   fontFamily: Constant.montserratMedium,
                //    fontSize: 15,
                ///    color: CustomTheme.color232F34)),
                )
          ],
        ));
  }

  void datePicker(
    BuildContext context,
    TextEditingController startTimecontroller,
    TextEditingController endTimecontroller,
    String dateTime,
    DateTime dateTimeDTS,
    DateTime dateTimeDTE,
    RxBool isShowTextField,
    RxBool isShowConfirm,
    List<TimeClass> timeList,
    List<TimeClassDT> timeListDT,
  ) {
    showCupertinoModalPopup(
        barrierColor: CustomTheme.blackColor.withOpacity(0.4),
        barrierDismissible: false,
        context: context,
        builder: (_) => Material(
              child: Container(
                height: Get.height * 0.7,
                color: CustomTheme.blackColor.withOpacity(0.4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3)),
                          color: CustomTheme.primaryColor,
                        ),
                        height: Get.height * 0.3,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: CupertinoDatePicker(
                            // maximumYear: 2016,
                            // minimumYear: 1950,
                            use24hFormat: false,
                            dateOrder: DatePickerDateOrder.mdy,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              debugPrint(val.toString());
                              if (startTimecontroller.text == '') {
                                dateTimeDTS = val;
                              } else {
                                dateTimeDTE = val;
                              }
                              setState(() {
                                String formattedTime =
                                    DateFormat.jm().format(val);

                                final a = formattedTime.split("-");
                                dateTime = a[0];
                                if (kDebugMode) {
                                  print(
                                      "------------------ $dateTime -------------------");
                                }
                              });
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3)),
                          color: CustomTheme.whiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isShowTextField.value = false;
                                Get.back();
                              },
                              child: SizedBox(
                                height: Get.height * 0.055,
                                width: Get.width * 0.3,
                                // decoration: BoxDecoration(
                                //     color: Colors.black,
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: Constant.montserratRegular,
                                      fontSize: 16,
                                      color: CustomTheme.color232F34,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Container(
                                width: Get.width * 0.001,
                                height: Get.height * 0.05,
                                color: CustomTheme.color232F34),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Obx(() {
                              return InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                        "Enter in func +++++++++++++++++++++++++");
                                  }
                                  if (isShowConfirm.value) {
                                    // if (timeList[0].startTime == '' &&
                                    //     timeList[0].endTime == '') {
                                    //   timeList.clear();
                                    //   timeListDT.clear();
                                    // }
                                    // if first time slot is going to add
                                    if (timeList.isEmpty) {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfWednesday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      Get.back();
                                    } else {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      // if same time already exist
                                      for (int i = 0;
                                          i < timeList.length;
                                          i++) {
                                        // if start time is already in list
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) ||
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) &&
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }
                                      // if select time between added slot
                                      // if start time is smaller then end time
                                      for (int i = 0;
                                          i < timeListDT.length;
                                          i++) {
                                        DateTime startListDate = DateTime.parse(
                                            timeListDT[i].startTimeDT);
                                        DateTime endListDate = DateTime.parse(
                                            timeListDT[i].endTimeDT);
                                        // if select time between added slot
                                        if (dateTimeDTS
                                                .isAfter(startListDate) &&
                                            dateTimeDTS.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (dateTimeDTE
                                                .isAfter(startListDate) &&
                                            dateTimeDTE.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        // if start time is smaller then end time
                                        if (dateTimeDTS.isAfter(dateTimeDTE)) {
                                          Get.snackbar('Error',
                                              'The selected time is invalid');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }

                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfWednesday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      if (kDebugMode) {
                                        print(
                                            'Time List of Date time $timeListDT');
                                      }
                                      Get.back();
                                    }
                                  } else {
                                    if (startTimecontroller.text.isEmpty) {
                                      if (dateTime == '') {
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++ -- $dateTime");
                                        }
                                        String formattedTime = DateFormat.jm()
                                            .format(DateTime.now());
                                        dateTime = formattedTime;
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++$dateTime");
                                        }
                                        startTimecontroller.text =
                                            formattedTime;
                                        isShowTextField.value = true;
                                      } else {
                                        setState(() {
                                          startTimecontroller.text =
                                              dateTime.toString();
                                          isShowTextField.value = true;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        endTimecontroller.text =
                                            dateTime.toString();
                                        isShowConfirm.value = true;
                                      });
                                    }
                                  }
                                },
                                child: SizedBox(
                                  height: Get.height * 0.055,
                                  width: Get.width * 0.3,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.black,
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(
                                      !isShowConfirm.value ? 'Ok' : 'Confirm',
                                      style: TextStyle(
                                        fontFamily: Constant.montserratRegular,
                                        fontSize: 16,
                                        color: CustomTheme.color232F34,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: Get.width * 0.005,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Obx(() {
                        return isShowTextField.value != true
                            ? const SizedBox()
                            : SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Start Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: startTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'End Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: endTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.005,
                                    ),
                                  ],
                                ),
                              );
                      })
                    ],
                  ),
                ),
              ),
            ));
  }
}

// Thursday
class ReuseableScheduleWidgetTursday extends StatefulWidget {
  CreateShopScheduleControllerN weekDayController;
  final String weekDay;
  final bool isDivider;
  final RxBool isSwitchValue;
  final List<TimeClass> timeList;
  ReuseableScheduleWidgetTursday({
    Key? key,
    required this.weekDayController,
    required this.weekDay,
    required this.isDivider,
    required this.isSwitchValue,
    required this.timeList,
  }) : super(key: key);
  @override
  State<ReuseableScheduleWidgetTursday> createState() =>
      _ReuseableScheduleWidgetTursdayState();
}

class _ReuseableScheduleWidgetTursdayState
    extends State<ReuseableScheduleWidgetTursday> {
  int? length;
  @override
  void initState() {
    super.initState();
    length = widget.timeList.length;
    widget.weekDayController.heightofListviewOfThursday =
        (Get.height * 0) * length!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.weekDay,
                    style: TextStyle(
                        fontFamily: Constant.montserratSemiBold,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
                const Spacer(),
                SizedBox(
                    height: Get.height * 0.03,
                    width: Get.height * 0.03,
                    child: Switch(
                        activeTrackColor: CustomTheme.color707070,
                        activeColor: CustomTheme.color232F34,
                        inactiveThumbColor: CustomTheme.colorC7CACB,
                        onChanged: (val) {
                          setState(() {
                            setState(() {
                              widget.weekDayController.isThursdaySwitched
                                      .value =
                                  !widget.weekDayController.isThursdaySwitched
                                      .value;
                              if (widget.weekDayController.isThursdaySwitched
                                      .value ==
                                  false) {
                                widget.weekDayController.isThursdaySwitched
                                    .value = false;
                                widget.weekDayController.thursdayTimeList
                                    .clear();
                                if (kDebugMode) {
                                  print(widget.weekDayController
                                      .isThursdaySwitched.value);
                                  print(widget
                                      .weekDayController.thursdayTimeList);
                                }
                              }

                              // widget.weekDayController.schedulesOfShop
                              //     .add(ScheduleListItems(
                              //         '4', // day ID
                              //         widget
                              //             .weekDayController // day on off
                              //             .isThursdaySwitched
                              //             .value,
                              //         widget
                              //             .weekDayController // time
                              //             .thursdayTimeList));
                            });
                          });
                        },
                        value:
                            widget.weekDayController.isThursdaySwitched.value)),
              ],
            ),
            const SizedBox(height: 10),
            widget.weekDayController.isThursdaySwitched.value
                ? SizedBox(
                    height: widget.weekDayController.heightofListviewOfThursday,
                    child: ListView.builder(
                      itemCount: widget.timeList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.18,
                                  height: 30,
                                  child: widget.timeList[index].startTime == ''
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            Text(
                                              widget.timeList[index].startTime,
                                              style: TextStyle(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                fontSize: 15,
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: Get.width * 0.18,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                widget.timeList[index].startTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 10,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: CustomTheme.color232F34,
                                          ),
                                        ),
                                      ),
                                widget.timeList[index].endTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: SizedBox(
                                          width: Get.width * 0.18,
                                          height: 30,
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.timeList[index].endTime,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  fontSize: 15,
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Container(
                                                width: Get.width * 0.18,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ));
                      },
                    ),
                  )
                : Text('Closed',
                    style: TextStyle(
                        fontFamily: Constant.montserratMedium,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
            Visibility(
              visible: widget.weekDayController.isThursdaySwitched.value,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.weekDayController.startTimecontroller.clear();
                        widget.weekDayController.endTimecontroller.clear();
                        widget.weekDayController.dateTime = '';
                        widget.weekDayController.dateTimeDTS = DateTime(0);
                        widget.weekDayController.dateTimeDTE = DateTime(0);
                        widget.weekDayController.isConfirmButton.value = false;
                      });
                      datePicker(
                        context,
                        widget.weekDayController.startTimecontroller,
                        widget.weekDayController.endTimecontroller,
                        widget.weekDayController.dateTime,
                        widget.weekDayController.dateTimeDTS,
                        widget.weekDayController.dateTimeDTE,
                        widget.weekDayController.isShowTextField,
                        widget.weekDayController.isConfirmButton,
                        widget.weekDayController.thursdayTimeList,
                        widget.weekDayController.thursdayTimeListDT,
                      );
                    },
                    child: Text('+ Add Shift',
                        style: TextStyle(
                            fontFamily: Constant.montserratMedium,
                            fontSize: 15,
                            color: CustomTheme.color232F34))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.01),
                child: widget.isDivider
                    ? Divider(color: CustomTheme.color232F34.withOpacity(0.4))
                    : const SizedBox()
                //Text('Closed',
                // style: TextStyle(
                //   fontFamily: Constant.montserratMedium,
                //    fontSize: 15,
                ///    color: CustomTheme.color232F34)),
                )
          ],
        ));
  }

  void datePicker(
    BuildContext context,
    TextEditingController startTimecontroller,
    TextEditingController endTimecontroller,
    String dateTime,
    DateTime dateTimeDTS,
    DateTime dateTimeDTE,
    RxBool isShowTextField,
    RxBool isShowConfirm,
    List<TimeClass> timeList,
    List<TimeClassDT> timeListDT,
  ) {
    showCupertinoModalPopup(
        barrierColor: CustomTheme.blackColor.withOpacity(0.4),
        barrierDismissible: false,
        context: context,
        builder: (_) => Material(
              child: Container(
                height: Get.height * 0.7,
                color: CustomTheme.blackColor.withOpacity(0.4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3)),
                          color: CustomTheme.primaryColor,
                        ),
                        height: Get.height * 0.3,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: CupertinoDatePicker(
                            // maximumYear: 2016,
                            // minimumYear: 1950,
                            use24hFormat: false,
                            dateOrder: DatePickerDateOrder.mdy,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              debugPrint(val.toString());
                              if (startTimecontroller.text == '') {
                                dateTimeDTS = val;
                              } else {
                                dateTimeDTE = val;
                              }
                              setState(() {
                                String formattedTime =
                                    DateFormat.jm().format(val);

                                final a = formattedTime.split("-");
                                dateTime = a[0];
                                if (kDebugMode) {
                                  print(
                                      "------------------ $dateTime -------------------");
                                }
                              });
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3)),
                          color: CustomTheme.whiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isShowTextField.value = false;
                                Get.back();
                              },
                              child: SizedBox(
                                height: Get.height * 0.055,
                                width: Get.width * 0.3,
                                // decoration: BoxDecoration(
                                //     color: Colors.black,
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: Constant.montserratRegular,
                                      fontSize: 16,
                                      color: CustomTheme.color232F34,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Container(
                                width: Get.width * 0.001,
                                height: Get.height * 0.05,
                                color: CustomTheme.color232F34),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Obx(() {
                              return InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                        "Enter in func +++++++++++++++++++++++++");
                                  }
                                  if (isShowConfirm.value) {
                                    // if (timeList[0].startTime == '' &&
                                    //     timeList[0].endTime == '') {
                                    //   timeList.clear();
                                    //   timeListDT.clear();
                                    // }
                                    // if first time slot is going to add
                                    if (timeList.isEmpty) {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfThursday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      Get.back();
                                    } else {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      // if same time already exist
                                      for (int i = 0;
                                          i < timeList.length;
                                          i++) {
                                        // if start time is already in list
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) ||
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) &&
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }
                                      // if select time between added slot
                                      // if start time is smaller then end time
                                      for (int i = 0;
                                          i < timeListDT.length;
                                          i++) {
                                        DateTime startListDate = DateTime.parse(
                                            timeListDT[i].startTimeDT);
                                        DateTime endListDate = DateTime.parse(
                                            timeListDT[i].endTimeDT);
                                        // if select time between added slot
                                        if (dateTimeDTS
                                                .isAfter(startListDate) &&
                                            dateTimeDTS.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (dateTimeDTE
                                                .isAfter(startListDate) &&
                                            dateTimeDTE.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        // if start time is smaller then end time
                                        if (dateTimeDTS.isAfter(dateTimeDTE)) {
                                          Get.snackbar('Error',
                                              'The selected time is invalid');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }

                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfThursday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      if (kDebugMode) {
                                        print(
                                            'Time List of Date time $timeListDT');
                                      }
                                      Get.back();
                                    }
                                  } else {
                                    if (startTimecontroller.text.isEmpty) {
                                      if (dateTime == '') {
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++ -- $dateTime");
                                        }
                                        String formattedTime = DateFormat.jm()
                                            .format(DateTime.now());
                                        dateTime = formattedTime;
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++$dateTime");
                                        }
                                        startTimecontroller.text =
                                            formattedTime;
                                        isShowTextField.value = true;
                                      } else {
                                        setState(() {
                                          startTimecontroller.text =
                                              dateTime.toString();
                                          isShowTextField.value = true;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        endTimecontroller.text =
                                            dateTime.toString();
                                        isShowConfirm.value = true;
                                      });
                                    }
                                  }
                                },
                                child: SizedBox(
                                  height: Get.height * 0.055,
                                  width: Get.width * 0.3,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.black,
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(
                                      !isShowConfirm.value ? 'Ok' : 'Confirm',
                                      style: TextStyle(
                                        fontFamily: Constant.montserratRegular,
                                        fontSize: 16,
                                        color: CustomTheme.color232F34,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: Get.width * 0.005,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Obx(() {
                        return isShowTextField.value != true
                            ? const SizedBox()
                            : SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Start Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: startTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'End Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: endTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.005,
                                    ),
                                  ],
                                ),
                              );
                      })
                    ],
                  ),
                ),
              ),
            ));
  }
}

// Friday
class ReuseableScheduleWidgetFriday extends StatefulWidget {
  CreateShopScheduleControllerN weekDayController;
  final String weekDay;
  final bool isDivider;
  final RxBool isSwitchValue;
  final List<TimeClass> timeList;
  ReuseableScheduleWidgetFriday({
    Key? key,
    required this.weekDayController,
    required this.weekDay,
    required this.isDivider,
    required this.isSwitchValue,
    required this.timeList,
  }) : super(key: key);
  @override
  State<ReuseableScheduleWidgetFriday> createState() =>
      _ReuseableScheduleWidgetFridayState();
}

class _ReuseableScheduleWidgetFridayState
    extends State<ReuseableScheduleWidgetFriday> {
  int? length;
  @override
  void initState() {
    super.initState();
    length = widget.timeList.length;
    widget.weekDayController.heightofListviewOfFriday =
        (Get.height * 0) * length!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.weekDay,
                    style: TextStyle(
                        fontFamily: Constant.montserratSemiBold,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
                const Spacer(),
                SizedBox(
                    height: Get.height * 0.03,
                    width: Get.height * 0.03,
                    child: Switch(
                        activeTrackColor: CustomTheme.color707070,
                        activeColor: CustomTheme.color232F34,
                        inactiveThumbColor: CustomTheme.colorC7CACB,
                        onChanged: (val) {
                          setState(() {
                            setState(() {
                              widget.weekDayController.isFridaySwitched.value =
                                  !widget
                                      .weekDayController.isFridaySwitched.value;
                              if (widget.weekDayController.isFridaySwitched
                                      .value ==
                                  false) {
                                widget.weekDayController.isFridaySwitched
                                    .value = false;
                                widget.weekDayController.fridayTimeList.clear();
                                if (kDebugMode) {
                                  print(widget.weekDayController
                                      .isFridaySwitched.value);
                                  print(
                                      widget.weekDayController.fridayTimeList);
                                }
                              }
                              // widget.weekDayController.schedulesOfShop
                              //     .add(ScheduleListItems(
                              //         '5', // day ID
                              //         widget
                              //             .weekDayController // day on off
                              //             .isFridaySwitched
                              //             .value,
                              //         widget
                              //             .weekDayController // time
                              //             .fridayTimeList));
                            });
                          });
                        },
                        value:
                            widget.weekDayController.isFridaySwitched.value)),
              ],
            ),
            const SizedBox(height: 10),
            widget.weekDayController.isFridaySwitched.value
                ? SizedBox(
                    height: widget.weekDayController.heightofListviewOfFriday,
                    child: ListView.builder(
                      itemCount: widget.timeList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.18,
                                  height: 30,
                                  child: widget.timeList[index].startTime == ''
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            Text(
                                              widget.timeList[index].startTime,
                                              style: TextStyle(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                fontSize: 15,
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: Get.width * 0.18,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                widget.timeList[index].startTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 10,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: CustomTheme.color232F34,
                                          ),
                                        ),
                                      ),
                                widget.timeList[index].endTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: SizedBox(
                                          width: Get.width * 0.18,
                                          height: 30,
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.timeList[index].endTime,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  fontSize: 15,
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Container(
                                                width: Get.width * 0.18,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ));
                      },
                    ),
                  )
                : Text('Closed',
                    style: TextStyle(
                        fontFamily: Constant.montserratMedium,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
            Visibility(
              visible: widget.weekDayController.isFridaySwitched.value,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.weekDayController.startTimecontroller.clear();
                        widget.weekDayController.endTimecontroller.clear();
                        widget.weekDayController.dateTime = '';
                        widget.weekDayController.dateTimeDTS = DateTime(0);
                        widget.weekDayController.dateTimeDTE = DateTime(0);
                        widget.weekDayController.isConfirmButton.value = false;
                      });
                      datePicker(
                        context,
                        widget.weekDayController.startTimecontroller,
                        widget.weekDayController.endTimecontroller,
                        widget.weekDayController.dateTime,
                        widget.weekDayController.dateTimeDTS,
                        widget.weekDayController.dateTimeDTE,
                        widget.weekDayController.isShowTextField,
                        widget.weekDayController.isConfirmButton,
                        widget.weekDayController.fridayTimeList,
                        widget.weekDayController.fridayTimeListDT,
                      );
                    },
                    child: Text('+ Add Shift',
                        style: TextStyle(
                            fontFamily: Constant.montserratMedium,
                            fontSize: 15,
                            color: CustomTheme.color232F34))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.01),
                child: widget.isDivider
                    ? Divider(color: CustomTheme.color232F34.withOpacity(0.4))
                    : const SizedBox()
                //Text('Closed',
                // style: TextStyle(
                //   fontFamily: Constant.montserratMedium,
                //    fontSize: 15,
                ///    color: CustomTheme.color232F34)),
                )
          ],
        ));
  }

  void datePicker(
    BuildContext context,
    TextEditingController startTimecontroller,
    TextEditingController endTimecontroller,
    String dateTime,
    DateTime dateTimeDTS,
    DateTime dateTimeDTE,
    RxBool isShowTextField,
    RxBool isShowConfirm,
    List<TimeClass> timeList,
    List<TimeClassDT> timeListDT,
  ) {
    showCupertinoModalPopup(
        barrierColor: CustomTheme.blackColor.withOpacity(0.4),
        barrierDismissible: false,
        context: context,
        builder: (_) => Material(
              child: Container(
                height: Get.height * 0.7,
                color: CustomTheme.blackColor.withOpacity(0.4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3)),
                          color: CustomTheme.primaryColor,
                        ),
                        height: Get.height * 0.3,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: CupertinoDatePicker(
                            // maximumYear: 2016,
                            // minimumYear: 1950,
                            use24hFormat: false,
                            dateOrder: DatePickerDateOrder.mdy,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              debugPrint(val.toString());
                              if (startTimecontroller.text == '') {
                                dateTimeDTS = val;
                              } else {
                                dateTimeDTE = val;
                              }
                              setState(() {
                                String formattedTime =
                                    DateFormat.jm().format(val);

                                final a = formattedTime.split("-");
                                dateTime = a[0];
                                if (kDebugMode) {
                                  print(
                                      "------------------ $dateTime -------------------");
                                }
                              });
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3)),
                          color: CustomTheme.whiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isShowTextField.value = false;
                                Get.back();
                              },
                              child: SizedBox(
                                height: Get.height * 0.055,
                                width: Get.width * 0.3,
                                // decoration: BoxDecoration(
                                //     color: Colors.black,
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: Constant.montserratRegular,
                                      fontSize: 16,
                                      color: CustomTheme.color232F34,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Container(
                                width: Get.width * 0.001,
                                height: Get.height * 0.05,
                                color: CustomTheme.color232F34),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Obx(() {
                              return InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                        "Enter in func +++++++++++++++++++++++++");
                                  }
                                  if (isShowConfirm.value) {
                                    // if (timeList[0].startTime == '' &&
                                    //     timeList[0].endTime == '') {
                                    //   timeList.clear();
                                    //   timeListDT.clear();
                                    // }
                                    // if first time slot is going to add
                                    if (timeList.isEmpty) {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfFriday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      Get.back();
                                    } else {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      // if same time already exist
                                      for (int i = 0;
                                          i < timeList.length;
                                          i++) {
                                        // if start time is already in list
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) ||
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) &&
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }
                                      // if select time between added slot
                                      // if start time is smaller then end time
                                      for (int i = 0;
                                          i < timeListDT.length;
                                          i++) {
                                        DateTime startListDate = DateTime.parse(
                                            timeListDT[i].startTimeDT);
                                        DateTime endListDate = DateTime.parse(
                                            timeListDT[i].endTimeDT);
                                        // if select time between added slot
                                        if (dateTimeDTS
                                                .isAfter(startListDate) &&
                                            dateTimeDTS.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (dateTimeDTE
                                                .isAfter(startListDate) &&
                                            dateTimeDTE.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        // if start time is smaller then end time
                                        if (dateTimeDTS.isAfter(dateTimeDTE)) {
                                          Get.snackbar('Error',
                                              'The selected time is invalid');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }

                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfFriday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      if (kDebugMode) {
                                        print(
                                            'Time List of Date time $timeListDT');
                                      }
                                      Get.back();
                                    }
                                  } else {
                                    if (startTimecontroller.text.isEmpty) {
                                      if (dateTime == '') {
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++ -- $dateTime");
                                        }
                                        String formattedTime = DateFormat.jm()
                                            .format(DateTime.now());
                                        dateTime = formattedTime;
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++$dateTime");
                                        }
                                        startTimecontroller.text =
                                            formattedTime;
                                        isShowTextField.value = true;
                                      } else {
                                        setState(() {
                                          startTimecontroller.text =
                                              dateTime.toString();
                                          isShowTextField.value = true;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        endTimecontroller.text =
                                            dateTime.toString();
                                        isShowConfirm.value = true;
                                      });
                                    }
                                  }
                                },
                                child: SizedBox(
                                  height: Get.height * 0.055,
                                  width: Get.width * 0.3,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.black,
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(
                                      !isShowConfirm.value ? 'Ok' : 'Confirm',
                                      style: TextStyle(
                                        fontFamily: Constant.montserratRegular,
                                        fontSize: 16,
                                        color: CustomTheme.color232F34,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: Get.width * 0.005,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Obx(() {
                        return isShowTextField.value != true
                            ? const SizedBox()
                            : SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Start Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: startTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'End Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: endTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.005,
                                    ),
                                  ],
                                ),
                              );
                      })
                    ],
                  ),
                ),
              ),
            ));
  }
}

// Saturday
class ReuseableScheduleWidgetSaturday extends StatefulWidget {
  CreateShopScheduleControllerN weekDayController;
  final String weekDay;
  final bool isDivider;
  final RxBool isSwitchValue;
  final List<TimeClass> timeList;
  ReuseableScheduleWidgetSaturday({
    Key? key,
    required this.weekDayController,
    required this.weekDay,
    required this.isDivider,
    required this.isSwitchValue,
    required this.timeList,
  }) : super(key: key);
  @override
  State<ReuseableScheduleWidgetSaturday> createState() =>
      _ReuseableScheduleWidgetSaturdayState();
}

class _ReuseableScheduleWidgetSaturdayState
    extends State<ReuseableScheduleWidgetSaturday> {
  int? length;
  @override
  void initState() {
    super.initState();
    length = widget.timeList.length;
    widget.weekDayController.heightofListviewOfSaturday =
        (Get.height * 0) * length!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.weekDay,
                    style: TextStyle(
                        fontFamily: Constant.montserratSemiBold,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
                const Spacer(),
                SizedBox(
                    height: Get.height * 0.03,
                    width: Get.height * 0.03,
                    child: Switch(
                        activeTrackColor: CustomTheme.color707070,
                        activeColor: CustomTheme.color232F34,
                        inactiveThumbColor: CustomTheme.colorC7CACB,
                        onChanged: (val) {
                          setState(() {
                            setState(() {
                              widget.weekDayController.isSaturdaySwitched
                                      .value =
                                  !widget.weekDayController.isSaturdaySwitched
                                      .value;
                              if (widget.weekDayController.isSaturdaySwitched
                                      .value ==
                                  false) {
                                widget.weekDayController.isSaturdaySwitched
                                    .value = false;
                                widget.weekDayController.saturdayTimeList
                                    .clear();
                                if (kDebugMode) {
                                  print(widget.weekDayController
                                      .isSaturdaySwitched.value);
                                  print(widget
                                      .weekDayController.saturdayTimeList);
                                }
                              }
                              // widget.weekDayController.schedulesOfShop
                              //     .add(ScheduleListItems(
                              //         '6', // day ID
                              //         widget
                              //             .weekDayController // day on off
                              //             .isSaturdaySwitched
                              //             .value,
                              //         widget
                              //             .weekDayController // time
                              //             .saturdayTimeList));
                            });
                          });
                        },
                        value:
                            widget.weekDayController.isSaturdaySwitched.value)),
              ],
            ),
            const SizedBox(height: 10),
            widget.weekDayController.isSaturdaySwitched.value
                ? SizedBox(
                    height: widget.weekDayController.heightofListviewOfSaturday,
                    child: ListView.builder(
                      itemCount: widget.timeList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.18,
                                  height: 30,
                                  child: widget.timeList[index].startTime == ''
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            Text(
                                              widget.timeList[index].startTime,
                                              style: TextStyle(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                fontSize: 15,
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: Get.width * 0.18,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                widget.timeList[index].startTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 10,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: CustomTheme.color232F34,
                                          ),
                                        ),
                                      ),
                                widget.timeList[index].endTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: SizedBox(
                                          width: Get.width * 0.18,
                                          height: 30,
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.timeList[index].endTime,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  fontSize: 15,
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Container(
                                                width: Get.width * 0.18,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ));
                      },
                    ),
                  )
                : Text('Closed',
                    style: TextStyle(
                        fontFamily: Constant.montserratMedium,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
            Visibility(
              visible: widget.weekDayController.isSaturdaySwitched.value,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.weekDayController.startTimecontroller.clear();
                        widget.weekDayController.endTimecontroller.clear();
                        widget.weekDayController.dateTime = '';
                        widget.weekDayController.dateTimeDTS = DateTime(0);
                        widget.weekDayController.dateTimeDTE = DateTime(0);
                        widget.weekDayController.isConfirmButton.value = false;
                      });
                      datePicker(
                        context,
                        widget.weekDayController.startTimecontroller,
                        widget.weekDayController.endTimecontroller,
                        widget.weekDayController.dateTime,
                        widget.weekDayController.dateTimeDTS,
                        widget.weekDayController.dateTimeDTE,
                        widget.weekDayController.isShowTextField,
                        widget.weekDayController.isConfirmButton,
                        widget.weekDayController.saturdayTimeList,
                        widget.weekDayController.saturdayTimeListDT,
                      );
                    },
                    child: Text('+ Add Shift',
                        style: TextStyle(
                            fontFamily: Constant.montserratMedium,
                            fontSize: 15,
                            color: CustomTheme.color232F34))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.01),
                child: widget.isDivider
                    ? Divider(color: CustomTheme.color232F34.withOpacity(0.4))
                    : const SizedBox()
                //Text('Closed',
                // style: TextStyle(
                //   fontFamily: Constant.montserratMedium,
                //    fontSize: 15,
                ///    color: CustomTheme.color232F34)),
                )
          ],
        ));
  }

  void datePicker(
    BuildContext context,
    TextEditingController startTimecontroller,
    TextEditingController endTimecontroller,
    String dateTime,
    DateTime dateTimeDTS,
    DateTime dateTimeDTE,
    RxBool isShowTextField,
    RxBool isShowConfirm,
    List<TimeClass> timeList,
    List<TimeClassDT> timeListDT,
  ) {
    showCupertinoModalPopup(
        barrierColor: CustomTheme.blackColor.withOpacity(0.4),
        barrierDismissible: false,
        context: context,
        builder: (_) => Material(
              child: Container(
                height: Get.height * 0.7,
                color: CustomTheme.blackColor.withOpacity(0.4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3)),
                          color: CustomTheme.primaryColor,
                        ),
                        height: Get.height * 0.3,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: CupertinoDatePicker(
                            // maximumYear: 2016,
                            // minimumYear: 1950,
                            use24hFormat: false,
                            dateOrder: DatePickerDateOrder.mdy,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              debugPrint(val.toString());
                              if (startTimecontroller.text == '') {
                                dateTimeDTS = val;
                              } else {
                                dateTimeDTE = val;
                              }
                              setState(() {
                                String formattedTime =
                                    DateFormat.jm().format(val);

                                final a = formattedTime.split("-");
                                dateTime = a[0];
                                if (kDebugMode) {
                                  print(
                                      "------------------ $dateTime -------------------");
                                }
                              });
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3)),
                          color: CustomTheme.whiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isShowTextField.value = false;
                                Get.back();
                              },
                              child: SizedBox(
                                height: Get.height * 0.055,
                                width: Get.width * 0.3,
                                // decoration: BoxDecoration(
                                //     color: Colors.black,
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: Constant.montserratRegular,
                                      fontSize: 16,
                                      color: CustomTheme.color232F34,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Container(
                                width: Get.width * 0.001,
                                height: Get.height * 0.05,
                                color: CustomTheme.color232F34),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Obx(() {
                              return InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                        "Enter in func +++++++++++++++++++++++++");
                                  }
                                  if (isShowConfirm.value) {
                                    // if (timeList[0].startTime == '' &&
                                    //     timeList[0].endTime == '') {
                                    //   timeList.clear();
                                    //   timeListDT.clear();
                                    // }
                                    // if first time slot is going to add
                                    if (timeList.isEmpty) {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfSaturday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      Get.back();
                                    } else {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      // if same time already exist
                                      for (int i = 0;
                                          i < timeList.length;
                                          i++) {
                                        // if start time is already in list
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) ||
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) &&
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }
                                      // if select time between added slot
                                      // if start time is smaller then end time
                                      for (int i = 0;
                                          i < timeListDT.length;
                                          i++) {
                                        DateTime startListDate = DateTime.parse(
                                            timeListDT[i].startTimeDT);
                                        DateTime endListDate = DateTime.parse(
                                            timeListDT[i].endTimeDT);
                                        // if select time between added slot
                                        if (dateTimeDTS
                                                .isAfter(startListDate) &&
                                            dateTimeDTS.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (dateTimeDTE
                                                .isAfter(startListDate) &&
                                            dateTimeDTE.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        // if start time is smaller then end time
                                        if (dateTimeDTS.isAfter(dateTimeDTE)) {
                                          Get.snackbar('Error',
                                              'The selected time is invalid');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }

                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfSaturday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      if (kDebugMode) {
                                        print(
                                            'Time List of Date time $timeListDT');
                                      }
                                      Get.back();
                                    }
                                  } else {
                                    if (startTimecontroller.text.isEmpty) {
                                      if (dateTime == '') {
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++ -- $dateTime");
                                        }
                                        String formattedTime = DateFormat.jm()
                                            .format(DateTime.now());
                                        dateTime = formattedTime;
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++$dateTime");
                                        }
                                        startTimecontroller.text =
                                            formattedTime;
                                        isShowTextField.value = true;
                                      } else {
                                        setState(() {
                                          startTimecontroller.text =
                                              dateTime.toString();
                                          isShowTextField.value = true;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        endTimecontroller.text =
                                            dateTime.toString();
                                        isShowConfirm.value = true;
                                      });
                                    }
                                  }
                                },
                                child: SizedBox(
                                  height: Get.height * 0.055,
                                  width: Get.width * 0.3,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.black,
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(
                                      !isShowConfirm.value ? 'Ok' : 'Confirm',
                                      style: TextStyle(
                                        fontFamily: Constant.montserratRegular,
                                        fontSize: 16,
                                        color: CustomTheme.color232F34,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: Get.width * 0.005,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Obx(() {
                        return isShowTextField.value != true
                            ? const SizedBox()
                            : SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Start Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: startTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'End Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: endTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.005,
                                    ),
                                  ],
                                ),
                              );
                      })
                    ],
                  ),
                ),
              ),
            ));
  }
}

// Sunday
class ReuseableScheduleWidgetSunday extends StatefulWidget {
  CreateShopScheduleControllerN weekDayController;
  final String weekDay;
  final bool isDivider;
  final RxBool isSwitchValue;
  final List<TimeClass> timeList;
  ReuseableScheduleWidgetSunday({
    Key? key,
    required this.weekDayController,
    required this.weekDay,
    required this.isDivider,
    required this.isSwitchValue,
    required this.timeList,
  }) : super(key: key);
  @override
  State<ReuseableScheduleWidgetSunday> createState() =>
      _ReuseableScheduleWidgetSundayState();
}

class _ReuseableScheduleWidgetSundayState
    extends State<ReuseableScheduleWidgetSunday> {
  int? length;
  @override
  void initState() {
    super.initState();
    length = widget.timeList.length;
    widget.weekDayController.heightofListviewOfSunday =
        (Get.height * 0) * length!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.weekDay,
                    style: TextStyle(
                        fontFamily: Constant.montserratSemiBold,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
                const Spacer(),
                SizedBox(
                    height: Get.height * 0.03,
                    width: Get.height * 0.03,
                    child: Switch(
                        activeTrackColor: CustomTheme.color707070,
                        activeColor: CustomTheme.color232F34,
                        inactiveThumbColor: CustomTheme.colorC7CACB,
                        onChanged: (val) {
                          setState(() {
                            setState(() {
                              widget.weekDayController.isSundaySwitched.value =
                                  !widget
                                      .weekDayController.isSundaySwitched.value;
                              if (widget.weekDayController.isSundaySwitched
                                      .value ==
                                  false) {
                                widget.weekDayController.isSundaySwitched
                                    .value = false;
                                widget.weekDayController.sundayTimeList.clear();
                                if (kDebugMode) {
                                  print(widget.weekDayController
                                      .isFridaySwitched.value);
                                  print(
                                      widget.weekDayController.sundayTimeList);
                                }
                              }
                              // widget.weekDayController.schedulesOfShop
                              //     .add(ScheduleListItems(
                              //         '7', // day ID
                              //         widget
                              //             .weekDayController // day on off
                              //             .isSundaySwitched
                              //             .value,
                              //         widget
                              //             .weekDayController // time
                              //             .sundayTimeList));
                            });
                          });
                        },
                        value:
                            widget.weekDayController.isSundaySwitched.value)),
              ],
            ),
            const SizedBox(height: 10),
            widget.weekDayController.isSundaySwitched.value
                ? SizedBox(
                    height: widget.weekDayController.heightofListviewOfSunday,
                    child: ListView.builder(
                      itemCount: widget.timeList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.18,
                                  height: 30,
                                  child: widget.timeList[index].startTime == ''
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            Text(
                                              widget.timeList[index].startTime,
                                              style: TextStyle(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                fontSize: 15,
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: Get.width * 0.18,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: CustomTheme.color232F34,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                widget.timeList[index].startTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 10,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: CustomTheme.color232F34,
                                          ),
                                        ),
                                      ),
                                widget.timeList[index].endTime == ''
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: SizedBox(
                                          width: Get.width * 0.18,
                                          height: 30,
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.timeList[index].endTime,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  fontSize: 15,
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Container(
                                                width: Get.width * 0.18,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CustomTheme.color232F34,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ));
                      },
                    ),
                  )
                : Text('Closed',
                    style: TextStyle(
                        fontFamily: Constant.montserratMedium,
                        fontSize: 15,
                        color: CustomTheme.color232F34)),
            Visibility(
              visible: widget.weekDayController.isSundaySwitched.value,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.weekDayController.startTimecontroller.clear();
                        widget.weekDayController.endTimecontroller.clear();
                        widget.weekDayController.dateTime = '';
                        widget.weekDayController.dateTimeDTS = DateTime(0);
                        widget.weekDayController.dateTimeDTE = DateTime(0);
                        widget.weekDayController.isConfirmButton.value = false;
                      });
                      datePicker(
                        context,
                        widget.weekDayController.startTimecontroller,
                        widget.weekDayController.endTimecontroller,
                        widget.weekDayController.dateTime,
                        widget.weekDayController.dateTimeDTS,
                        widget.weekDayController.dateTimeDTE,
                        widget.weekDayController.isShowTextField,
                        widget.weekDayController.isConfirmButton,
                        widget.weekDayController.sundayTimeList,
                        widget.weekDayController.sundayTimeListDT,
                      );
                    },
                    child: Text('+ Add Shift',
                        style: TextStyle(
                            fontFamily: Constant.montserratMedium,
                            fontSize: 15,
                            color: CustomTheme.color232F34))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.01),
                child: widget.isDivider
                    ? Divider(color: CustomTheme.color232F34.withOpacity(0.4))
                    : const SizedBox()
                //Text('Closed',
                // style: TextStyle(
                //   fontFamily: Constant.montserratMedium,
                //    fontSize: 15,
                ///    color: CustomTheme.color232F34)),
                )
          ],
        ));
  }

  void datePicker(
    BuildContext context,
    TextEditingController startTimecontroller,
    TextEditingController endTimecontroller,
    String dateTime,
    DateTime dateTimeDTS,
    DateTime dateTimeDTE,
    RxBool isShowTextField,
    RxBool isShowConfirm,
    List<TimeClass> timeList,
    List<TimeClassDT> timeListDT,
  ) {
    showCupertinoModalPopup(
        barrierColor: CustomTheme.blackColor.withOpacity(0.4),
        barrierDismissible: false,
        context: context,
        builder: (_) => Material(
              child: Container(
                height: Get.height * 0.7,
                color: CustomTheme.blackColor.withOpacity(0.4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3)),
                          color: CustomTheme.primaryColor,
                        ),
                        height: Get.height * 0.3,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: CupertinoDatePicker(
                            // maximumYear: 2016,
                            // minimumYear: 1950,
                            use24hFormat: false,
                            dateOrder: DatePickerDateOrder.mdy,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              debugPrint(val.toString());
                              if (startTimecontroller.text == '') {
                                dateTimeDTS = val;
                              } else {
                                dateTimeDTE = val;
                              }
                              setState(() {
                                String formattedTime =
                                    DateFormat.jm().format(val);

                                final a = formattedTime.split("-");
                                dateTime = a[0];
                                if (kDebugMode) {
                                  print(
                                      "------------------ $dateTime -------------------");
                                }
                              });
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3)),
                          color: CustomTheme.whiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isShowTextField.value = false;
                                Get.back();
                              },
                              child: SizedBox(
                                height: Get.height * 0.055,
                                width: Get.width * 0.3,
                                // decoration: BoxDecoration(
                                //     color: Colors.black,
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: Constant.montserratRegular,
                                      fontSize: 16,
                                      color: CustomTheme.color232F34,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Container(
                                width: Get.width * 0.001,
                                height: Get.height * 0.05,
                                color: CustomTheme.color232F34),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Obx(() {
                              return InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print(
                                        "Enter in func +++++++++++++++++++++++++");
                                  }
                                  if (isShowConfirm.value) {
                                    // if (timeList[0].startTime == '' &&
                                    //     timeList[0].endTime == '') {
                                    //   timeList.clear();
                                    //   timeListDT.clear();
                                    // }
                                    // if first time slot is going to add
                                    if (timeList.isEmpty) {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfSunday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      Get.back();
                                    } else {
                                      // if both start and end time will same
                                      if (startTimecontroller.text ==
                                          endTimecontroller.text) {
                                        Get.snackbar('Error', 'Invalid Time');
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        isShowConfirm.value = false;
                                        return;
                                      }
                                      // if same time already exist
                                      for (int i = 0;
                                          i < timeList.length;
                                          i++) {
                                        // if start time is already in list
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) ||
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (timeList[i].startTime.contains(
                                                startTimecontroller.text) &&
                                            timeList[i].endTime.contains(
                                                endTimecontroller.text)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }
                                      // if select time between added slot
                                      // if start time is smaller then end time
                                      for (int i = 0;
                                          i < timeListDT.length;
                                          i++) {
                                        DateTime startListDate = DateTime.parse(
                                            timeListDT[i].startTimeDT);
                                        DateTime endListDate = DateTime.parse(
                                            timeListDT[i].endTimeDT);
                                        // if select time between added slot
                                        if (dateTimeDTS
                                                .isAfter(startListDate) &&
                                            dateTimeDTS.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        if (dateTimeDTE
                                                .isAfter(startListDate) &&
                                            dateTimeDTE.isBefore(endListDate)) {
                                          Get.snackbar('Error', 'Invalid Time');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                        // if start time is smaller then end time
                                        if (dateTimeDTS.isAfter(dateTimeDTE)) {
                                          Get.snackbar('Error',
                                              'The selected time is invalid');
                                          startTimecontroller.text = '';
                                          endTimecontroller.text = '';
                                          dateTimeDTS = DateTime(0);
                                          dateTimeDTE = DateTime(0);
                                          isShowConfirm.value = false;
                                          return;
                                        }
                                      }

                                      setState(() {
                                        timeList.add(TimeClass(
                                            startTimecontroller.text,
                                            endTimecontroller.text));
                                        timeListDT.add(TimeClassDT(
                                            dateTimeDTS.toString(),
                                            dateTimeDTE.toString()));
                                        startTimecontroller.text = '';
                                        endTimecontroller.text = '';
                                        dateTimeDTS = DateTime(0);
                                        dateTimeDTE = DateTime(0);
                                        length = widget.timeList.length;
                                        widget.weekDayController
                                                .heightofListviewOfSunday =
                                            (Get.height * 0.03) * length!;
                                      });
                                      if (kDebugMode) {
                                        print(
                                            'Time List of Date time $timeListDT');
                                      }
                                      Get.back();
                                    }
                                  } else {
                                    if (startTimecontroller.text.isEmpty) {
                                      if (dateTime == '') {
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++ -- $dateTime");
                                        }
                                        String formattedTime = DateFormat.jm()
                                            .format(DateTime.now());
                                        dateTime = formattedTime;
                                        if (kDebugMode) {
                                          print(
                                              "+++++++++++++++++++++++++$dateTime");
                                        }
                                        startTimecontroller.text =
                                            formattedTime;
                                        isShowTextField.value = true;
                                      } else {
                                        setState(() {
                                          startTimecontroller.text =
                                              dateTime.toString();
                                          isShowTextField.value = true;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        endTimecontroller.text =
                                            dateTime.toString();
                                        isShowConfirm.value = true;
                                      });
                                    }
                                  }
                                },
                                child: SizedBox(
                                  height: Get.height * 0.055,
                                  width: Get.width * 0.3,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.black,
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(
                                      !isShowConfirm.value ? 'Ok' : 'Confirm',
                                      style: TextStyle(
                                        fontFamily: Constant.montserratRegular,
                                        fontSize: 16,
                                        color: CustomTheme.color232F34,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: Get.width * 0.005,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Obx(() {
                        return isShowTextField.value != true
                            ? const SizedBox()
                            : SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Start Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: startTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'End Time',
                                          style: TextStyle(
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 18,
                                            color: CustomTheme.blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.055,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                              // color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.03),
                                            child: Center(
                                              child: TextField(
                                                controller: endTimecontroller,
                                                style: TextStyle(
                                                  fontFamily:
                                                      Constant.montserratBold,
                                                  fontSize: 18,
                                                  color: CustomTheme.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.005,
                                    ),
                                  ],
                                ),
                              );
                      })
                    ],
                  ),
                ),
              ),
            ));
  }
}
