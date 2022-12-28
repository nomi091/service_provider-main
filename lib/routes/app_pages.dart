import 'package:get/route_manager.dart';
import 'package:service_provider/modules/auth_splash/forgot_password/email_confirmation_forgotpassword.dart';
import 'package:service_provider/modules/auth_splash/forgot_password/forgort_set_password.dart';
import 'package:service_provider/modules/auth_splash/forgot_password/forgot_password.dart';
import 'package:service_provider/modules/auth_splash/forgot_password/forgot_password_binding.dart';
import 'package:service_provider/modules/auth_splash/forgot_password/verify_pin.dart';
import 'package:service_provider/modules/auth_splash/login/login_Screen_binding.dart';
import 'package:service_provider/modules/auth_splash/login/login_Screen_page.dart';
import 'package:service_provider/modules/auth_splash/sign_up/email_confirmation_signup.dart';
import 'package:service_provider/modules/auth_splash/sign_up/sign_up_binding.dart';
import 'package:service_provider/modules/auth_splash/sign_up/sign_up_page.dart';
import 'package:service_provider/modules/auth_splash/sign_up/verify_pin_signUp.dart';
import 'package:service_provider/modules/auth_splash/splash-screen/splash_Screen_binding.dart';
import 'package:service_provider/modules/auth_splash/splash-screen/splash_Screen_page.dart';
import 'package:service_provider/modules/bottom_navigatin_bar/bottom_navigation_bar_binding.dart';
import 'package:service_provider/modules/bottom_navigatin_bar/bottom_navigation_screen.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/detail/pending_detail_binding.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/detail/pending_details.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/home.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/change_password/change_password.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/change_password/change_password_binding.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/personal_profile/personal_profile.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/personal_profile/personal_profile_binding.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/page/change_langugae.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/page/term_policies.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/setting_binding.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/setting_page.dart';
import 'package:service_provider/modules/create_shop/create_shop_binding.dart';
import 'package:service_provider/modules/create_shop/create_shop_page.dart';
import 'package:service_provider/modules/create_shop/shop_schedule.dart/shop_schedule_binding.dart';
import 'package:service_provider/modules/create_shop/shop_schedule.dart/shop_schedule_page.dart';
import 'package:service_provider/modules/select_language/select_language.dart';
import 'package:service_provider/routes/app_routes.dart';
import '../modules/bottom_navigation_screens/my_request/my_request_main_binding.dart';
import '../modules/bottom_navigation_screens/my_request/my_request_main.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNavigationBar,
      page: () => const BottomNavigationScreen(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.emailConfirmSignUpScreen,
      page: () => const EmailConfirmSignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpVerifyPinScreen,
      page: () => const VerifyPinSigUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.emailConfirmForgotPasswordScreen,
      page: () => const EmailConfirmForgotPasswordPage(),
      binding: ForgotPasswordPageBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordPageBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotSetPasswordScreen,
      page: () => const ForgotSetPasswordPage(),
      binding: ForgotPasswordPageBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotVerifyPinScreen,
      page: () => const VerifyForgotPinPage(),
      binding: ForgotPasswordPageBinding(),
    ),
    GetPage(
      name: AppRoutes.createShop,
      page: () => const CreateShopPage(),
      binding: CreateShopBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.termandPolicy,
      page: () => const TermAndPoliciesPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.changeLangugae,
      page: () => const ChangeLanguage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.myRequest,
      page: () => const MyRequestPage(),
      binding: MyRequestBinding(),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: MyRequestBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.personalProfile,
      page: () => const PersonalProfilePage(),
      binding: PersonalProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.pendingDetail,
      page: () => const PendingDetailView(
        screenName: '',
      ),
      binding: PendingDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.shopScehduleDetail,
      page: () => const CreatShopSchedulePage(),
      binding: CreateShopScheduleBinding(),
    ),
    GetPage(
      name: AppRoutes.selectLanguage,
      page: () => const SelectLanguageScreen(),
      // binding: SplashBinding(),
    ),
  ];
}
