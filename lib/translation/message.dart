import 'package:get/route_manager.dart';
import 'package:service_provider/translation/language/arabic_lang.dart';
import 'package:service_provider/translation/language/eng_lang.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en': EnglishLang.map, 'ar': ArabicLang.map};
}
