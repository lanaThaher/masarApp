import 'dart:ffi';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/icons/license_icon.dart';
import 'package:masar_app/views/MainPage/home_page.dart';
import 'package:masar_app/views/Payment/checkout.dart';
import 'package:masar_app/views/profile/digital_view.dart';
import 'package:masar_app/views/profile/profile.dart';

class bottomAppBar extends StatefulWidget {
  const bottomAppBar({super.key});

  @override
  State<bottomAppBar> createState() => _bottomAppBarState();
}

class _bottomAppBarState extends State<bottomAppBar> {

  int i=2;

  List screens = [
    const CheckOut(),
    const HomePage(),
    const DigitalView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
          height: 60,
          backgroundColor: kBackGroundColor,
          color: kPrimaryColor,
          animationCurve: Curves.ease,
          index: 2,
          animationDuration: const Duration(milliseconds: 100),
          buttonBackgroundColor: kPrimaryColor,
          onTap: (selectedIndex) {
            setState(() {
              i= selectedIndex;
            });
            if(i == 0){
              Get.toNamed("profile");
            }
            else if (i == 1) {
              Get.toNamed("Credit");
            }
            else if (i == 2){
              Get.offAllNamed("homepage");
            }
            else if (i == 3) {
              Get.toNamed("digitaLicense");
            }
          },
          items: <Widget>[
            
              Tooltip(
                message: "profile",
                textStyle: const TextStyle(color:fontColor),
                waitDuration: Duration.zero,
                showDuration: const Duration(seconds: 2),
                decoration: ShapeDecoration(shape: Border.all(width: 1, style: BorderStyle.solid, color:bbblack), color: kBackGroundColor),
                child: const Icon(Icons.account_box_rounded, color: kBackGroundColor, size: 40)
              ),
              Tooltip(
                message: "checkout page",
                textStyle: const TextStyle(color:fontColor),
                waitDuration: Duration.zero,
                showDuration: const Duration(seconds: 2),
                decoration: ShapeDecoration(shape: Border.all(width: 1, style: BorderStyle.solid, color:bbblack), color: kBackGroundColor),
                child: const Icon(Icons.credit_card_outlined, color: kBackGroundColor, size: 40),
              ),
              Tooltip(
                message: "home page",
                textStyle: const TextStyle(color:fontColor),
                waitDuration: Duration.zero,
                showDuration: const Duration(seconds: 2),
                decoration: ShapeDecoration(shape: Border.all(width: 1, style: BorderStyle.solid, color:bbblack,), color: kBackGroundColor),
                child: const Icon(Icons.home_filled, color: kBackGroundColor, size: 40,),
              ),
              Tooltip(
                message: "digital license",
                textStyle: const TextStyle(color:fontColor),
                waitDuration: Duration.zero,
                showDuration: const Duration(seconds: 2),
                decoration: ShapeDecoration(shape: Border.all(width: 1, style: BorderStyle.solid, color:bbblack,), color: kBackGroundColor),
                child: const CustomIcons(
                              iconName: Icons.rectangle_rounded,
                              colorOne: kBackGroundColor,
                              rectangleSize: 47,
                              topPadding: 14,
                              startPaddingOne: 2.0,
                              iconSize: 20,
                              startPaddingTwo: 19,
                              colorTwo: kPrimaryColor)),
          ]
    );
  }
}
