// Constant  contains icon's,image's and font's paths that we are using in app
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Constant {
  //Date formats
  // static var dobFormat = DateFormat('dd/MM/yyyy');
  static var dobFormat = DateFormat('MMM/dd/yyyy');
  static var timeFormat = DateFormat('hh:mm a');
  //select gender list
  static List<String> genderList = ['male', 'female', 'other'];

  // All pages padding from both sides
  static double pagePadding = Get.width * 0.062;

  //Bottom Navigation bar icons size (Active Icons)
  static double bottomNavIconHeight = Get.height * 0.06;
  static double bottomNavIconWidth = Get.width * 0.06;
  //Bottom Navigation bar icons size (Inactive Icons)
  static double bottomNavIconHeightUnselect = Get.height * 0.05;
  static double bottomNavIconWidthUnselect = Get.width * 0.05;

  // Icons Paths
  static String icons = 'assets/icons_images/';
  static String backArrowIcon = '${icons}back_arrow_icon.png';
  static String dropDown2 = '${icons}drop_down 2.png';
  static String upArrow = '${icons}up-arrow-icon.png';
  static String nextArrowWhiteIcon = '${icons}next_arrow_white_icon.png';
  static String nextArrowBlackIcon = '${icons}arrow_right_black.png';
  static String buttonRightArrow = '${icons}button_right_arrow.png';
  static String backArrow = '${icons}back_arrow_icon.png';
  static String dropDownIcon = '${icons}drop_down.png';
  static String locationIcon = '${icons}location_icon.png';
  static String notificationIcon = '${icons}notification_icon.png';
  static String changePasswordIcon = '${icons}change_password_icon.png';
  static String arrowLeftIcon = '${icons}arrow_left_icon.png';
  static String locationBlue = '${icons}location_blue.png';
  static String locationMarker = '${icons}location_marker 2.png';
  static String backArrowWhite = '${icons}back_arrow_white.png';
  static String settingIcon = '${icons}setting.png';
  static String circleTickBlackBackground = '${icons}circle_tick_black_background.png';
  static String emailConfirmation = '${icons}email_confirmation.png';
  static String screenLogo = '${icons}screen_logo.png';
  static String myRequest = '${icons}my_request.png';
  static String home = '${icons}home.png';
  static String car = '${icons}car.png';
  static String img1 = '${icons}img1.png';
  static String img2 = '${icons}img2.png';
  static String calendarIcon = '${icons}calendar_icon.png';
  static String carIcon = '${icons}car_icon.png';
  static String profile = '${icons}profile.png';
  static String settingBottom = '${icons}setting_bottom.png';
  static String settingUnselected = '${icons}setting_unselected.png';
  static String splashLogoIcon = '${icons}splash_logo_icon.png';
  static String profileGenderIcon = '${icons}profile_gender_icon.png';
  static String keyIcon = '${icons}keyIcon.png';
  static String keyS = '${icons}keyS.png';
  static String dustbinIcon = '${icons}dustbin_icon.png';
  static String phoneIcon = '${icons}phoneIcon.png';
  static String emailIcon = '${icons}emailIcon.png';
  static String calenderIcon = '${icons}calenderIcon.png';
  static String carIcon1 = '${icons}carIcon.png';
  static String gear = '${icons}gear.png';
  static String brandIcon = '${icons}brand.png'; 
  static String carImage = '${icons}car_image.png';
  static String locationIconn = '${icons}locationMarkerIcon.png'; 
  static String blackCarImage = '${icons}black_car.png';
  static String whiteCarImage = '${icons}white_car.png';
  static String redCarImage = '${icons}red_car.png';
  static String faultyImage = '${icons}faulty_img.png';
  static String locationMarkerIcon = '${icons}location_marker.png';
  static String attachedFileIcon = '${icons}attached_file.png';
  static String cameraIcon = '${icons}cameraIcon.png';
  static String filterIcon = '${icons}filterIcon.png';
  static String numerPlateIcon = '${icons}numerPlateIcon.png';
  static String globalIcon = '${icons}globalIcon.png';
  static String importIcon = '${icons}importIcon.png';
  static String termConditionIcon = '${icons}termConditionIcon.png';
  static String forwordIcon = '${icons}forwordIcon.png';
  static String personalInfo = '${icons}personal-info.png';
  static String shopDetail = '${icons}shop_detail.png';
  static String deleteProfile = '${icons}delete_profile.png';
  static String keynew = '${icons}keynew.png';
  static String logout = '${icons}logout.png';
  static String pdfPrefix = '${icons}pdfPrefix.png';
  static String pdfPost = '${icons}pdfPost.png';
  static String home1 = '${icons}home1.png';
  static String home2 = '${icons}home 2.png';
  static String termsconditions = '${icons}termsconditions.png';
  static String changeLanguage = '${icons}changeLanguge.png';
  static String backgroundimage1 = '${icons}backgroundimage.png';
  static String homeForService = '${icons}homeForService.png';
  static String shopForSerice = '${icons}shopForSerice.png';
  static String imageselect = '${icons}imageselect.png';
  //new
   static String homeS = '${icons}homeS.png';
   static String homeUS = '${icons}homeUS.png';
   static String myrequestS = '${icons}myrequestS.png';
   static String myrequestUS = '${icons}myrequestUS.png';
   static String profileS = '${icons}profileS.png';
   static String profileUS = '${icons}profileUS.png';
   static String settingS = '${icons}settingS.png';
   static String settingUS = '${icons}settingUS.png';
   static String backgroundofRequest = '${icons}backgroundofRequest.png';
   static String editimage = '${icons}editimage.png';
   static String homeSer = '${icons}homeSer.png';
   static String shopSer1 = '${icons}shopSer1.png';
   static String backwardIcon = '${icons}backwar_icon.png';


  // Fonts paths
  static String montserratRegular = 'MontserratRegular';
  static String montserratBold = 'MontserratBold';
  static String montserratSemiBold = 'MontserratSemiBold';
  static String montserratMedium = 'MontserratMedium';
  static String montserratLight = 'MontserratLight';

  //profile page Strings
  static String dobHint = 'MM/DD/YEAR';
  static String timeHint = '00:00 ';

  static showDialog() {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
    );
  }

  static showSnackBar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.white70,
        titleText: Text(
          title,
          style: TextStyle(fontFamily: Constant.montserratBold),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontFamily: Constant.montserratRegular),
        ));
  }
}
