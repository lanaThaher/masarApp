import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/bottom_bar.dart';
import 'package:masar_app/components/custom_button.dart';
import 'package:masar_app/components/payment_image.dart';
import 'package:masar_app/constant.dart';

class SuccessPayment extends StatefulWidget {
  const SuccessPayment({super.key});

  @override
  State<SuccessPayment> createState() => _SuccessPaymentState();
}
  
  class _SuccessPaymentState extends State<SuccessPayment> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        automaticallyImplyLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PaymentImage(path: "assets/images/successfull.png"),
            const SizedBox(height:30),
            Text("22".tr, style: const TextStyle(fontSize: 40, color: fontColor, fontWeight: FontWeight.bold)),
            const SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("23".tr, textAlign:TextAlign.center, style: const TextStyle(fontSize: 23, color: fontColor, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height:30),            
            Button(onTap: (){
              Get.offAndToNamed('homepage');
              },
              text: "27".tr),           
            const SizedBox(height:30),
            const BottomBar(), 
          ],
        ),
    );
  }
}