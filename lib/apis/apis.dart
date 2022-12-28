class Apis {
  // Base Url
  static String baseUrl = 'https://darbak-bk-zdfzoourza-uc.a.run.app/api/';

  static String auth = 'sp/auth/';
  static String shop = 'sp/shops/';
  static String coreActivity = 'coreActivities/';
  static String services = 'services/';
  static String shared = 'shared/';
  static String profile = 'profile/';


  // auth
  static String loginWithEmail = '$baseUrl${auth}login';
  static String forgotPassword = '$baseUrl${auth}forgetPassword';
  static String verifyOtpForgetPassword = '$baseUrl${auth}verifyOtpForgetPassword';
  static String resetForgetedPassword = '$baseUrl${auth}resetForgetedPassword';
  static String signup = '$baseUrl${auth}signup';
  static String resetPassword = '$baseUrl${auth}resetPassword';

  // shop
  static String createShop = '$baseUrl${shop}addNew/';
  static String updateShop = '$baseUrl${shop}updateById/';
  static String getShopDetail = '$baseUrl${shop}findById/';

  // core activity
  static String coreActivities = '$baseUrl${coreActivity}getAll';

  // service
  static String service = '$baseUrl${services}getByCoreActivity/';
  static String addNew = '$baseUrl${services}addNew';
  static String updateService = '$baseUrl${services}update/';
  
  // upload File
  static String uploadImg = '$baseUrl${shared}uploadFile/';
  
  // update profile
  static String updateProfile = '$baseUrl${profile}update/';

 
}
