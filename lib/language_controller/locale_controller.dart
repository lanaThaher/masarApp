import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:masar_app/main.dart';

class MylocaleController extends GetxController {

  Locale intialLang = sharepref!.getString("lang") == "en" ? const Locale("en") : const Locale("ar") ;

  void changeLang (String codelang){
    Locale locale = Locale(codelang);
    sharepref!.setString('lang', codelang);
    Get.updateLocale(locale);
  }


}