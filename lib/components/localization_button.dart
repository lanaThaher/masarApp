import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/language_controller/locale_controller.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    MylocaleController langcontroller = Get.find();
    return FloatingActionButton(
      onPressed: () {
        if ("82".tr == "عربي") {
          langcontroller.changeLang("ar");
        } else if ("82".tr == "English") {
          langcontroller.changeLang("en");
        }
      },
      elevation: 0,
      backgroundColor: kPrimaryBackGroundColor,
      shape: const CircleBorder(), // Ensures the button is circular
      child: Text("82".tr),
    );
  }
}
