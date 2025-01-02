import 'package:flutter/material.dart';
import 'package:masar_app/components/app_bar.dart';
import 'package:masar_app/constant.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/custom_test_type_colum.dart';

class TestTypesView extends StatelessWidget {
  const TestTypesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: const App_Bar(title: ""),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height:50),
            Center(
              child: Text("55".tr, style: const TextStyle(color: kPrimaryTextColor,
                  fontSize: 28, fontWeight: FontWeight.bold),
              ),),
            const SizedBox(height: 45),
            CustomTestTypeColumn(
              icon: Icons.description,
              title: "56".tr,
              onTap: () {
                Get.toNamed("writtenTest1");
              },
            ),
            const SizedBox(height: 45),
            CustomTestTypeColumn(
              icon: Icons.directions_car,
              title: "57".tr,
              onTap: () { Get.toNamed("practicalTest");
              },
            )
          ],
        ),
      )
    );
  }
}
