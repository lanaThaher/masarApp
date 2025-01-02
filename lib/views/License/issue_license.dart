import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/document_file.dart';
import 'package:masar_app/constant.dart';

class IssueLicense extends StatefulWidget {
  const IssueLicense({super.key});

  @override
  State<IssueLicense> createState() => _IssueLicenseState();
}

class _IssueLicenseState extends State<IssueLicense> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: kBackGroundColor,
        appBar: AppBar(
          backgroundColor: kBackGroundColor,
          iconTheme: const IconThemeData(size: 25, color: kPrimaryColor),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("2".tr,
                    style: const TextStyle(
                        color: fontColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text("8".tr,
                    style: const TextStyle(
                        color: fontColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 22),
                Text("9".tr,
                    style: const TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    )),
                DocumentFile(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "96".tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 22),
                Text("10".tr,
                    style: const TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    )),
                DocumentFile(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "96".tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 22),
                Text("11".tr,
                    style: const TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    )),
                DocumentFile(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "96".tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                Button(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Get.toNamed("Credit");
                      }
                    },
                    text: "29".tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
