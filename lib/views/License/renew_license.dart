import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/document_file.dart';
import 'package:masar_app/constant.dart';

class RenewLicense extends StatefulWidget {
  const RenewLicense({super.key});

  @override
  State<RenewLicense> createState() => _RenewLicenseState();
}

class _RenewLicenseState extends State<RenewLicense> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        iconTheme: const IconThemeData(color: kPrimaryColor),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "4".tr,
                  style: const TextStyle(
                      color: fontColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "8".tr,
                  style: const TextStyle(
                      color: fontColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 22),
                Text(
                  "9".tr,
                  style: const TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DocumentFile(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "96".tr; // Error message
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 22),
                Text(
                  "10".tr,
                  style: const TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DocumentFile(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "96".tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 22),
                Text(
                  "12".tr,
                  style: const TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                    if (formKey.currentState?.validate() ?? false) {
                      Get.toNamed("Credit");
                    }
                  },
                  text: "29".tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
