import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/Api/PDF_Api.dart';
import 'package:masar_app/components/app_bar.dart';
import 'package:masar_app/components/navigation_bar.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/views/Manual/view_manual.dart';

class DriverManual extends StatefulWidget {
  const DriverManual({super.key});

  @override
  State<DriverManual> createState() => _DriverManualState();
}

class _DriverManualState extends State<DriverManual> {

  void openPDF (BuildContext context, File file) {
    Get.offAll(ManualViewPage(file: file));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      bottomNavigationBar: const bottomAppBar(),
      appBar: const App_Bar(title: '',),
      body: Container(
        margin: const EdgeInsets.only(top:200),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color.fromRGBO(0, 0, 0, 0.1)),
                child: IconButton(
                  onPressed: () async {
                    const path = "assets/Manual/DriversManual.pdf";
                    final file = await Pdfapi.loadAsset(path);
                    openPDF(context, file);
                  },
                  icon: const Icon(Icons.sim_card_download, size:160, color: kPrimaryColor))
                  ),
              const SizedBox(height: 40),
              Text("7".tr, style: const TextStyle(color: fontColor, fontSize: 25, fontWeight: FontWeight.bold),)
            ],
          ),
        )
      ),
    );
  }
}