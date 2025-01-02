import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/Icons.dart';
import 'package:masar_app/components/app_bar.dart';
import 'package:masar_app/components/navigation_bar.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/icons/license_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
        bottomNavigationBar: const bottomAppBar(),
        appBar: const App_Bar(title: '',),
        body: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1),               
                children: [
                  Service(icon: const Icon(Icons.event_note), onTap: ()=> Get.toNamed("TestType"), num: "1"),
                  Service( icon: const CustomIcons(
                            iconName: Icons.rectangle_rounded,
                            colorOne: kPrimaryColor,
                            rectangleSize: 85.0,
                            topPadding: 30,
                            startPaddingOne: 13.0,
                            iconSize: 30,
                            startPaddingTwo: 40,
                            colorTwo: kBackGroundColor),
                            onTap: ()=> Get.toNamed("issueLicense"), num: "2"),
                  Service( icon: const CustomIcons(
                            iconName: Icons.rectangle_outlined,
                            colorOne: kPrimaryColor,
                            rectangleSize: 85.0,
                            topPadding: 30,
                            startPaddingOne: 13.0,
                            iconSize: 30,
                            startPaddingTwo: 40,
                            colorTwo: kPrimaryColor),
                            onTap: ()=> Get.toNamed("digitaLicense"), num: "3"),
                  Service(icon: const Icon(Icons.sync_outlined),    onTap: ()=> Get.toNamed("renewLicense"), num: "4"),
                  Service(icon: const Icon(Icons.videocam_rounded), onTap: ()=> Get.toNamed(""), num: "5"),
                  Service(icon: const Icon(Icons.menu_book_sharp),  onTap: ()=> Get.toNamed("driverManual"), num: "6"),
                ],
            ),),         
        );
  }
}