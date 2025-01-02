import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/bottom_bar.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/payment_image.dart';
import 'package:masar_app/constant.dart';

class FailedPayment extends StatefulWidget {
  const FailedPayment({super.key});

  @override
  State<FailedPayment> createState() => _FailedPaymentState();
}

class _FailedPaymentState extends State<FailedPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        automaticallyImplyLeading: false,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PaymentImage(path: "assets/images/unsuccessful.png"),
            const SizedBox(height:30),
            Text("24".tr, style: const TextStyle(fontSize: 40, color: fontColor, fontWeight: FontWeight.bold)),
            const SizedBox(height:10),
            Text("25".tr, style: const TextStyle(fontSize: 23, color: fontColor, fontWeight: FontWeight.bold)),
            Text("26".tr, style: const TextStyle(fontSize: 23, color: fontColor, fontWeight: FontWeight.bold)),
            const SizedBox(height:30),  
            Button(onTap: (){Get.offAndToNamed("checkout");}, text: "28".tr),
            const SizedBox(height:30),
            const BottomBar(),
          ],
        ),
    );
  }
}