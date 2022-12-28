import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/auth_splash/splash-screen/splash_Screen_binding.dart';
import 'package:service_provider/routes/app_pages.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/translation/message.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

// <meta-data android:name=“com.google.android.geo.API_KEY”
//                android:value=“AIzaSyBJI13FY9aiexHtqr4b68UdSXaFO4I0Jcc”/>
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Get.deviceLocale, //const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'ar'),
        // supportedLocales: const [
        //   Locale('en'),
        //   Locale('kl'),
        // ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        translations: Languages(),
        theme: CustomTheme.lightTheme,
        initialRoute: AppRoutes.splashScreen, //selectLanguage()
        initialBinding: SplashBinding(),
        getPages: AppPages.pages,
      );
    });
  }
}
